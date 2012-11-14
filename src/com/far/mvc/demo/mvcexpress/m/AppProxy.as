package com.far.mvc.demo.mvcexpress.m 
{
	import com.far.mvc.demo.mvcexpress.Msg;
	import org.mvcexpress.mvc.Proxy;
	import com.far.mvc.demo.robotlegs.models.vo.ImageVo;
	import com.far.mvc.demo.common.util.NetLoad;
	/**
	 * ...
	 * @author far
	 */
	public class AppProxy extends Proxy 
	{
		private var imageUrl:String = "resource/images.xml";
		public function AppProxy() 
		{
			
		}
		override protected function onRegister():void 
		{
			super.onRegister();
		}
		
		override protected function onRemove():void 
		{
			super.onRemove();
		}
		public function beginLoadXML():void {
			NetLoad.getInstance().loadXML(imageUrl, loadComplete, false);
		}
		
		private function loadComplete(xml:XML):void
		{
			var data:Array = convertData(xml);
			sendMessage(Msg.LOADXMLCOMPLETE, data);
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