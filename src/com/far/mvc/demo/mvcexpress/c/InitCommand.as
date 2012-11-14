package com.far.mvc.demo.mvcexpress.c 
{
	import com.far.mvc.demo.mvcexpress.m.AppProxy;
	import org.mvcexpress.mvc.Command;
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.mvcexpress.v.ImageSelectMediator;
	import com.far.mvc.demo.mvcexpress.v.ImageShowMediator;
	
	/**
	 * ...
	 * @author far
	 */
	public class InitCommand extends Command 
	{
		
		public function InitCommand() 
		{
			
		}
		
		public function execute (blank:Object):void {
		   	var main:Main = blank as Main;
			mediatorMap.map(ImageSelect, ImageSelectMediator);
			mediatorMap.map(ImageShow, ImageShowMediator);
			var slelect:ImageSelect = main.createImageSelect();
			mediatorMap.mediate(slelect);
			var show:ImageShow = main.createImageShow();
			mediatorMap.mediate(show);
			proxyMap.map(new AppProxy());	
			
			commandMap.execute(StartUpCommand);
		}
	}

}