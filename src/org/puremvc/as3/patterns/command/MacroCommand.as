
package org.puremvc.as3.patterns.command 
{

	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.observer.*;
	
	
	public class MacroCommand extends Notifier implements ICommand, INotifier
	{
		//子命令数组
		private var subCommands:Array;
		
		//重写它时要用下suer
		public function MacroCommand()
		{
			subCommands = new Array();
			initializeMacroCommand();			
		}
		
		//用来增加子命令的
		protected function initializeMacroCommand():void
		{
		}
		
		//添加子命令方法
		protected function addSubCommand( commandClassRef:Class ): void
		{
			subCommands.push(commandClassRef);
		}
		//其实和简单命令差不多，最终执行的都是execute方法，但这个是执行一个简单命令数组,
		//这个地方可以改进一下，让子命令也可以是一个MacroCommand
		public final function execute( notification:INotification ) : void
		{
			while ( subCommands.length > 0) {
				var commandClassRef : Class = subCommands.shift();
				var commandInstance : ICommand = new commandClassRef();
				commandInstance.execute( notification );
			}
		}
								
	}
}