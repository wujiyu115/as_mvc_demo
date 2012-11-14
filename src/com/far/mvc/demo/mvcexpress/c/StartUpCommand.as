package com.far.mvc.demo.mvcexpress.c 
{
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.mvcexpress.v.ImageSelectMediator;
	import com.far.mvc.demo.mvcexpress.v.ImageShowMediator;
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
			mediatorMap.map(ImageSelect, ImageSelectMediator);
			mediatorMap.map(ImageShow, ImageShowMediator);
			var slelect:ImageSelect = main.createImageSelect();
			var show:ImageShow = main.createImageShow();
			trace(main);
		
		}
	}

}