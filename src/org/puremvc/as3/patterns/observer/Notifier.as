
package org.puremvc.as3.patterns.observer
{
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.facade.Facade;
	
	
	public class Notifier implements INotifier
	{
		//发送通知的基类， Proxy,Command,Mediator 都实现了
		public function sendNotification( notificationName:String, body:Object=null, type:String=null ):void 
		{
			facade.sendNotification( notificationName, body, type );
		}
		
		// Local reference to the Facade Singleton
		protected var facade:IFacade = Facade.getInstance();
	}
}