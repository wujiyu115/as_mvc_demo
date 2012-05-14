
package org.puremvc.as3.patterns.mediator
{
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.observer.*;
	import org.puremvc.as3.patterns.facade.Facade;

	public class Mediator extends Notifier implements IMediator, INotifier
	{

		//必须给个名字
		public static const NAME:String = 'Mediator';
		
		//一个名字和一个视图组件
		public function Mediator( mediatorName:String=null, viewComponent:Object=null ) {
			this.mediatorName = (mediatorName != null)?mediatorName:NAME; 
			this.viewComponent = viewComponent;	
		}

		
		public function getMediatorName():String 
		{	
			return mediatorName;
		}

		
		public function setViewComponent( viewComponent:Object ):void 
		{
			this.viewComponent = viewComponent;
		}

			
		public function getViewComponent():Object
		{	
			return viewComponent;
		}

		//关注的通知，就是一些常量
		public function listNotificationInterests():Array 
		{
			return [ ];
		}

		//像Command的execute一样,当收到通知就执行此方法
		public function handleNotification( notification:INotification ):void {}
		
		//注册此Mediator时可重写的方法
		public function onRegister( ):void {}

		
		public function onRemove( ):void {}

		// the mediator name
		protected var mediatorName:String;

		// The view component
		protected var viewComponent:Object;
	}
}