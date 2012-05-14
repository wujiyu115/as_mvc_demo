package com.far.mvc.demo.robotlegs_signal.models 
{
	import com.far.mvc.demo.common.util.NetLoad;
	import com.far.mvc.demo.robotlegs.models.vo.ImageVo;
	import com.far.mvc.demo.robotlegs_signal.signal.DataLoadCompleteSignal;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author far
	 */
	public class ImageModel extends Actor 
	{
		private var imageUrl :String = "resource/images.xml";
		[Inject]
		public var loadComSignal:DataLoadCompleteSignal;
		public function ImageModel() 
		{
			 
		}
		
		public function loadImageData():void 
		{
			NetLoad.getInstance().loadXML(imageUrl,loadComplete,false);
		}
		
		private function loadComplete(xml:XML):void 
		{
			var data:Array = convertData(xml);
		   loadComSignal.dispatch(data);
		}
		
		private function convertData(xml:XML):Array 
		{
			var data:Array = [];
			  var  images:XMLList = xml.image;
			  var len:int = images.length();
			  for (var i:int = 0; i < len; i++) 
			  {
				  data.push(new ImageVo(images[i].@label, images[i]));
			  }
			return data;
		}
		
	}

}