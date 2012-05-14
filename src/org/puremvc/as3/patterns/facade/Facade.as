
package org.puremvc.as3.patterns.facade
{

	import org.puremvc.as3.core.*;
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.observer.Notification;

	/**
	 * 这个类是一个便捷类，用来操纵Controller, View,Model
	 * 这是一个重写此类的例子
 	 * 
	 * 
	 *	import org.puremvc.as3.patterns.facade.&lowast;;
	 * 
	 *	import com.me.myapp.model.~~;
	 *	import com.me.myapp.view.~~;
	 *	import com.me.myapp.controller.~~;
	 * 
	 *	public class MyFacade extends Facade
	 *	{
	 *		//定义一些通知常量
	 *		public static const GO_COMMAND:String = "go";
	 * 		
	 *		// 覆盖单例工厂方法
	 *		public static function getInstance() : MyFacade {
	 *			if (instance == null) instance = new MyFacade();
	 *			return instance as MyFacade;
	 *		}
	 * 		
	 *		// 初始化Facade,super
	 *		override public function initializeFacade() : void {
	 *			super.initializeFacade();
	 *			// do any special subclass initialization here
	 *		}
	 *	
	 *		// 初始化Controller,super
	 *		override public function initializeController() : void {
	 *			// call super to use the PureMVC Controller Singleton. 
	 *			super.initializeController();
	 *			registerCommand( GO_COMMAND, com.me.myapp.controller.GoCommand )
	 *		}
	 *	
	 *		// 初始化Model,super
	 *		override public function initializeModel() : void {
	 *			// call super to use the PureMVC Model Singleton. 
	 *			super.initializeModel();
	 * 
	 *			regsiterProxy( new USStateNamesProxy() );
	 *		}
	 *	
	 *		// 初始化View,super
	 *		override public function initializeView() : void {
	 *			// call super to use the PureMVC View Singleton. 
	 *			super.initializeView();
	 * 
	 *			
	 *			registerMediator( new LoginMediator() ); 
	 * 
	 *		}
	 *	}
	 */
	public class Facade implements IFacade
	{
	    //如果重写了构造方法，用super 来实现子类的单例
		public function Facade( ) {
			if (instance != null) throw Error(SINGLETON_MSG);
			instance = this;
			initializeFacade();	
		}

		
		protected function initializeFacade(  ):void {
			initializeModel();
			initializeController();
			initializeView();
		}

		
		public static function getInstance():IFacade {
			if (instance == null) instance = new Facade( );
			return instance;
		}

		/**
		 * Controller 的单例 ，如果重写些方法，请用super
		 */
		protected function initializeController( ):void {
			if ( controller != null ) return;
			controller = Controller.getInstance();
		}

		/**
		 * Model 的单例 ，如果重写些方法，请用super
		 */
		protected function initializeModel( ):void {
			if ( model != null ) return;
			model = Model.getInstance();
		}
		
        /**
		 * View 的单例 ，如果重写些方法，请用super
		 */
		protected function initializeView( ):void {
			if ( view != null ) return;
			view = View.getInstance();
		}

		//注册命令，调用 Controller中的方法
		public function registerCommand( notificationName:String, commandClassRef:Class ):void 
		{
			controller.registerCommand( notificationName, commandClassRef );
		}

		//移除命令
		public function removeCommand( notificationName:String ):void 
		{
			controller.removeCommand( notificationName );
		}

		//是否注册了命令
		public function hasCommand( notificationName:String ) : Boolean
		{
			return controller.hasCommand(notificationName);
		}
       
		//注册数据模型
		public function registerProxy ( proxy:IProxy ):void	
		{
			model.registerProxy ( proxy );	
		}
				
		
		//得到已注册的数据模型
		public function retrieveProxy ( proxyName:String ):IProxy 
		{
			return model.retrieveProxy ( proxyName );	
		}

		//移除数据模型
		public function removeProxy ( proxyName:String ):IProxy 
		{
			var proxy:IProxy;
			if ( model != null ) proxy = model.removeProxy ( proxyName );	
			return proxy
		}

		//是否注册数据模型
		public function hasProxy( proxyName:String ) : Boolean
		{
			return model.hasProxy( proxyName );
		}
      //注册Mediator 
		public function registerMediator( mediator:IMediator ):void 
		{
			if ( view != null ) view.registerMediator( mediator );
		}
      //得到已注册的Medaitor
		public function retrieveMediator( mediatorName:String ):IMediator 
		{
			return view.retrieveMediator( mediatorName ) as IMediator;
		}

		//移除Mediator
		public function removeMediator( mediatorName:String ) : IMediator 
		{
			var mediator:IMediator;
			if ( view != null ) mediator = view.removeMediator( mediatorName );			
			return mediator;
		}

		//是否注册了Mediator
		public function hasMediator( mediatorName:String ) : Boolean
		{
			return view.hasMediator( mediatorName );
		}

		//发送通知
		public function sendNotification( notificationName:String, body:Object=null, type:String=null ):void 
		{
			notifyObservers( new Notification( notificationName, body, type ) );
		}

		//其实调用了view中定义的发送通知
		public function notifyObservers ( notification:INotification ):void {
			if ( view != null ) view.notifyObservers( notification );
		}

		// Private references to Model, View and Controller
		protected var controller : IController;
		protected var model		 : IModel;
		protected var view		 : IView;
		
		// The Singleton Facade instance.
		protected static var instance : IFacade; 
		
		// Message Constants
		protected const SINGLETON_MSG	: String = "Facade Singleton already constructed!";
	
	}
}