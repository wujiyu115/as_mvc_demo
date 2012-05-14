package com.far.mvc.demo.robotlegs.models
{
	import com.far.mvc.demo.common.util.NetLoad;
	import com.far.mvc.demo.robotlegs.events.ImageDataEvent;
	import com.far.mvc.demo.robotlegs.models.vo.ImageVo;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageModel extends Actor
	{
		private var imageUrl:String = "resource/images.xml";
		 
		
		public function ImageModel()
		{
		
		}
		
		public function loadImageData():void
		{
			NetLoad.getInstance().loadXML(imageUrl, loadComplete, false);
		}
		
		private function loadComplete(xml:XML):void
		{
			var data:Array = convertData(xml);
			dispatch(new ImageDataEvent(ImageDataEvent.DATALOADCOMPLETE, data));
		}
		
		private function convertData(xml:XML):Array
		{
			var data:Array = [];
			var images:XMLList = xml.image;
			var len:int = images.length();
			for (var i:int = 0; i < len; i++)
			{
				data.push(new ImageVo(images[i].@label, images[i]));
			}
			return data;
		}
	
	}

}