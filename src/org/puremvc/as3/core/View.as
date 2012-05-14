
package org.puremvc.as3.core
{

	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.observer.Observer;

	public class View implements IView
	{
		
		
		public function View( )
		{
			if (instance != null) throw Error(SINGLETON_MSG);
			instance = this;
			mediatorMap = new Array();
			observerMap = new Array();	
			initializeView();	
		}
		
	   //子类不覆盖构造器的情况 下预留的一个方法
		protected function initializeView(  ) : void 
		{
		}
	
	
		public static function getInstance() : IView 
		{
			if ( instance == null ) instance = new View( );
			return instance;
		}
				
		//注册观察者列表
		public function registerObserver ( notificationName:String, observer:IObserver ) : void
		{
			//观察者列表 采用 一个通知名对应 一个观察者数组的形式
			//当某个通知名对应的观察者列表存在则加入 ，否则 新建一个数组
			var observers:Array = observerMap[ notificationName ];
			if( observers ) {
				observers.push( observer );
			} else {
				observerMap[ notificationName ] = [ observer ];	
			}
		}

		/**
		 *通知观察者列表，响应某一通知
		 */
		public function notifyObservers( notification:INotification ) : void
		{
			if( observerMap[ notification.getName() ] != null ) {
				
				// Get a reference to the observers list for this notification name
				var observers_ref:Array = observerMap[ notification.getName() ] as Array;

				// Copy observers from reference array to working array, 
				// since the reference array may change during the notification loop
   				var observers:Array = new Array(); 
   				var observer:IObserver;
				for (var i:Number = 0; i < observers_ref.length; i++) { 
					observer = observers_ref[ i ] as IObserver;
					observers.push( observer );
				}
				
				// Notify Observers from the working array				
				for (i = 0; i < observers.length; i++) {
					observer = observers[ i ] as IObserver;
					//这句才是执行观察者的方法,对于Command来说是execute,对应Mediator来说是 handleNotification方法
					observer.notifyObserver( notification );
				}
			}
		}

		//从观察者列表中移除一个观察者
		public function removeObserver( notificationName:String, notifyContext:Object ):void
		{
			// the observer list for the notification under inspection
			var observers:Array = observerMap[ notificationName ] as Array;

			// find the observer for the notifyContext
			for ( var i:int=0; i<observers.length; i++ ) 
			{
				if ( Observer(observers[i]).compareNotifyContext( notifyContext ) == true ) {
					// there can only be one Observer for a given notifyContext 
					// in any given Observer list, so remove it and break
					observers.splice(i,1);
					break;
				}
			}

			// Also, when a Notification's Observer list length falls to 
			// zero, delete the notification key from the observer map
			if ( observers.length == 0 ) {
				delete observerMap[ notificationName ];		
			}
		} 

		//注册Mediator
		public function registerMediator( mediator:IMediator ) : void
		{
			//判断是否注册
			if ( mediatorMap[ mediator.getMediatorName() ] != null ) return;
			
			// 根据Mediator的名字来注册， 所以 mediator 必须给一个名字
			mediatorMap[ mediator.getMediatorName() ] = mediator;
			
			// 拿到Mediator关注的通知,这点与注册命令不同
			var interests:Array = mediator.listNotificationInterests();

			// Register Mediator as an observer for each of its notification interests
			if ( interests.length > 0 ) 
			{
				// 这里new的观察者对象 传递的是 handNotification方法,而command中传递execute
				
				/**
				 *  观察者模式的核心 : Mediator ,Command 为两个观察者,  Notifaction为被观察者
				 * */
				var observer:Observer = new Observer( mediator.handleNotification, mediator );

				// 注册到观察者列表
				for ( var i:Number=0;  i<interests.length; i++ ) {
					registerObserver( interests[i],  observer );
				}			
			}
			
			// 注册完成执行的方法，这个方法用来重写
			mediator.onRegister();
			
		}

		//得到已注册的 Mediator,根据名字得到
		public function retrieveMediator( mediatorName:String ) : IMediator
		{
			return mediatorMap[ mediatorName ];
		}

		//移除Mediator
		public function removeMediator( mediatorName:String ) : IMediator
		{
			// Retrieve the named mediator
			var mediator:IMediator = mediatorMap[ mediatorName ] as IMediator;
			
			if ( mediator ) 
			{
				// for every notification this mediator is interested in...
				var interests:Array = mediator.listNotificationInterests();
				for ( var i:Number=0; i<interests.length; i++ ) 
				{
					// remove the observer linking the mediator 
					// to the notification interest
					removeObserver( interests[i], mediator );
				}	
				
				// remove the mediator from the map		
				delete mediatorMap[ mediatorName ];
	
				// alert the mediator that it has been removed
				mediator.onRemove();
			}
			
			return mediator;
		}
		
		//是否注册Mediator
		public function hasMediator( mediatorName:String ) : Boolean
		{
			return mediatorMap[ mediatorName ] != null;
		}

		//注册的Mediator集合
		//这个列表 和 Controller中的命令列表都是一个临时的表，
		protected var mediatorMap : Array;

		// 观察者列表 ,指可接收通知的对象,Command,Mediatorv , 而 Proxy ,Facade 不行，因为它们只发送通知
		protected var observerMap	: Array;
		
		// Singleton instance
		protected static var instance	: IView;

		// Message Constants
		protected const SINGLETON_MSG	: String = "View Singleton already constructed!";
	}
}