package com.far.mvc.demo.robotlegs_signal.commands
{
	import com.far.mvc.demo.robotlegs_signal.signal.AddAllViewSignal;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author far
	 */
	public class StartUpCommand extends Command
	{
		private var main:Main;
		[Inject]
		public var _alladdSignal:AddAllViewSignal;
		override public function execute():void
		{
			
			main = contextView as Main;
			main.createImageSelect();
			main.createImageShow();
			//组件添加完成 
			 _alladdSignal.dispatch();
		}
	
	}

}