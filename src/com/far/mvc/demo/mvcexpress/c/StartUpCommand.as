package com.far.mvc.demo.mvcexpress.c 
{
	import org.mvcexpress.mvc.Command;
	
	/**
	 * ...
	 * @author far
	 */
	public class StartUpCommand extends Command 
	{
		
		public function StartUpCommand() 
		{
			
		}
		
		public function execute(blank:Object):void {
			 var main:Main =   blank as Main;
			 trace(main);
		}
	}

}