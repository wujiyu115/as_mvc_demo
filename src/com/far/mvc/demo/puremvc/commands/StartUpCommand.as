package com.far.mvc.demo.puremvc.commands
{
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.puremvc.enums.ApplicationEvent;
	import com.far.mvc.demo.puremvc.mediators.ImageSelectMediator;
	import com.far.mvc.demo.puremvc.mediators.ImageShowMediator;
	import com.far.mvc.demo.puremvc.proxys.ImageModel;
	import flash.display.Sprite;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * ...
	 * @author far
	 */
	public class StartUpCommand extends SimpleCommand
	{
		
		override public function execute(notification:INotification):void
		{
			var sp:Main = notification.getBody() as Main;
			var slelect:ImageSelect = sp.createImageSelect();
			var show:ImageShow = sp.createImageShow();
			facade.registerMediator(new ImageSelectMediator(slelect));
			facade.registerMediator(new ImageShowMediator(show));
			facade.registerProxy(new ImageModel());
		}
	
	}

}