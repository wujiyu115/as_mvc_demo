
package org.puremvc.as3.patterns.observer
{
	import org.puremvc.as3.interfaces.*;
/**
 * 观察者对象,用于执行通知方法
 */
	
	public class Observer implements IObserver
	{
		private var notify:Function;
		private var context:Object;
	
		/**
		 *  实始化要执行的方法，和执行它的类
		 * */
		public function Observer( notifyMethod:Function, notifyContext:Object ) 
		{
			setNotifyMethod( notifyMethod );
			setNotifyContext( notifyContext );
		}
		
		
		public function setNotifyMethod( notifyMethod:Function ):void
		{
			notify = notifyMethod;
		}
		
	
		public function setNotifyContext( notifyContext:Object ):void
		{
			context = notifyContext;
		}
		
	
		private function getNotifyMethod():Function
		{
			return notify;
		}
		
		
		private function getNotifyContext():Object
		{
			return context;
		}
		
		/*
		 * 通知观察者执行其方法
		 * **/
		public function notifyObserver( notification:INotification ):void
		{
			this.getNotifyMethod().apply(this.getNotifyContext(),[notification]);
		}
	
		/**
		 * 比较 调用 对象是否相同 
		 */
		 public function compareNotifyContext( object:Object ):Boolean
		 {
		 	return object === this.context;
		 }		
	}
}