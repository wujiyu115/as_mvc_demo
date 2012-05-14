package
{
	import com.bit101.components.ComboBox;
	import com.bit101.components.Style;
	import com.far.mvc.demo.common.view.ImageSelect;
	import com.far.mvc.demo.common.view.ImageShow;
	import com.far.mvc.demo.puremvc.ImageFacade;
	import com.far.mvc.demo.robotlegs.ImageShowContext;
	import com.far.mvc.demo.robotlegs_signal.ImageRobotLegSignal;
	import flash.display.Sprite;
	import flash.events.Event;
	import org.osflash.signals.natives.base.SignalSprite;
	import org.robotlegs.mvcs.Context;
	
	/**
	 * ...
	 * @author far
	 */
	public class Main extends Sprite
	{
		private var context:Context;
		private var facade:ImageFacade;
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Style.fontSize = 9;
			Style.fontName = "微软雅黑";
			Style.embedFonts = false;
			 
			//context = new ImageShowContext(this);
		   //context = new ImageRobotLegSignal(this);
		   facade =  ImageFacade.getInstance();
		   facade.startUp(this);

		}
		
		public function createImageSelect():ImageSelect
		{
			return new ImageSelect(this);
		}
		
		public function createImageShow():ImageShow
		{
			var imshow:ImageShow = new ImageShow();
			imshow.y = 50;
			this.addChild(imshow);
			return imshow;
		}
	
	}

}