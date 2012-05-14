
package org.puremvc.as3.patterns.command 
{

	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.observer.Notifier;
	
	
	public class SimpleCommand extends Notifier implements ICommand, INotifier 
	{
		//简单命令很简单就一个execute方法可重写 
		public function execute( notification:INotification ) : void
		{
			
		}
								
	}
}