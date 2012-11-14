package com.far.mvc.demo.mvcexpress.c
{
	
	import com.far.mvc.demo.mvcexpress.m.AppProxy;
	import org.mvcexpress.mvc.Command;

	
	/**
	 * ...
	 * @author far
	 */
	public class StartUpCommand extends Command
	{
		[Inject]
		public var _approxy:AppProxy;
		
		public function StartUpCommand()
		{
		
		}
		
		public function execute(blank:Object):void
		{
		
			
			_approxy.beginLoadXML();
		}
	}

}