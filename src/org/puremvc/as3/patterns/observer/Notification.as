/*
 PureMVC - Copyright(c) 2006-08 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
*/
package org.puremvc.as3.patterns.observer
{
	import org.puremvc.as3.interfaces.*;
	
	/**
	 *通知对象，储存通知信息, 通知名，通知主体，通知类型
	 * 
	 */
	public class Notification implements INotification
	{
		
		
		public function Notification( name:String, body:Object=null, type:String=null )
		{
			this.name = name;
			this.body = body;
			this.type = type;
		}
		
		
		public function getName():String
		{
			return name;
		}
		
		
		public function setBody( body:Object ):void
		{
			this.body = body;
		}
		
		
		public function getBody():Object
		{
			return body;
		}
		
		
		public function setType( type:String ):void
		{
			this.type = type;
		}
		
		
		public function getType():String
		{
			return type;
		}
        //返回通知对象的字符串表示
		public function toString():String
		{
			var msg:String = "Notification Name: "+getName();
			msg += "\nBody:"+(( body == null )?"null":body.toString());
			msg += "\nType:"+(( type == null )?"null":type);
			return msg;
		}
		
		// the name of the notification instance
		private var name			: String;
		// the type of the notification instance
		private var type			: String;
		// the body of the notification instance
		private var body			: Object;
		
	}
}