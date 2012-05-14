
package org.puremvc.as3.core
{
	
	import org.puremvc.as3.interfaces.*;
	
	
	public class Model implements IModel
	{
		
		public function Model( )
		{
			if (instance != null) throw Error(SINGLETON_MSG);
			instance = this;
			proxyMap = new Array();	
			initializeModel();	
		}
		
		//预留方法
		protected function initializeModel(  ) : void 
		{
		}
				
		
		public static function getInstance() : IModel 
		{
			if (instance == null) instance = new Model( );
			return instance;
		}

		//注数据模型 ,注册时执行
		public function registerProxy( proxy:IProxy ) : void
		{
			proxyMap[ proxy.getProxyName() ] = proxy;
			proxy.onRegister();
		}

		//得到已注册的数据模型
		public function retrieveProxy( proxyName:String ) : IProxy
		{
			return proxyMap[ proxyName ];
		}

		
		public function hasProxy( proxyName:String ) : Boolean
		{
			return proxyMap[ proxyName ] != null;
		}
      //移除 数据模型 ,数据模型并非 观察者，只能发送通知
		public function removeProxy( proxyName:String ) : IProxy
		{
			var proxy:IProxy = proxyMap [ proxyName ] as IProxy;
			if ( proxy ) 
			{
				proxyMap[ proxyName ] = null;
				proxy.onRemove();
			}
			return proxy;
		}

		// Mapping of proxyNames to IProxy instances
		protected var proxyMap : Array;

		// Singleton instance
		protected static var instance : IModel;
		
		// Message Constants
		protected const SINGLETON_MSG	: String = "Model Singleton already constructed!";

	}
}