
package org.puremvc.as3.patterns.proxy
{
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.observer.*;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class Proxy extends Notifier implements IProxy, INotifier
	{
       //必须给它一个名字
		public static var NAME:String = 'Proxy';
		
		//一个名字和一组数据
		
		public function Proxy( proxyName:String=null, data:Object=null ) 
		{
			
			this.proxyName = (proxyName != null)?proxyName:NAME; 
			if (data != null) setData(data);
		}

		
		public function getProxyName():String 
		{
			return proxyName;
		}		
		
		public function setData( data:Object ):void 
		{
			this.data = data;
		}
		
		
		public function getData():Object 
		{
			return data;
		}		

		public function onRegister( ):void {}

		
		public function onRemove( ):void {}
		
		
		// the proxy name
		protected var proxyName:String;
		
		// 数据模型 的数据属性
		protected var data:Object;
	}
}