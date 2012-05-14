
package org.puremvc.as3.core
{
	import org.puremvc.as3.core.*;
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.observer.*;
	
	
	public class Controller implements IController
	{
		
		
		/**
		 * 
		 * 初始化全局的命令数组,和管理Command的对象
		 */
		public function Controller( )
		{
			if (instance != null) throw Error(SINGLETON_MSG);
			instance = this;
			commandMap = new Array();	
			initializeController();	
		}
		
		
		protected function initializeController(  ) : void 
		{
			//初始化View
			view = View.getInstance();
		}
	
		 
		/**
		 * 
		 * 单例工厂方法
		 */
		public static function getInstance() : IController
		{
			if ( instance == null ) instance = new Controller( );
			return instance;
		}

		
		/**
		 * 当通知到来时,执行关注了通知的命令,实际上就是将注册在数组中对应的命令执行其execute方法
		 */
		public function executeCommand( note : INotification ) : void
		{
			var commandClassRef : Class = commandMap[ note.getName() ];
			if ( commandClassRef == null ) return;

			var commandInstance : ICommand = new commandClassRef();
			//执行关注通知的命令,将通知对象传递给命令
			commandInstance.execute( note );
		}

		
		 /**
		  * 注册命令，Facade中的registerCommand实际上调用了些方法
		  */
		public function registerCommand( notificationName : String, commandClassRef : Class ) : void
		{
			if ( commandMap[ notificationName ] == null ) {
				//将命令转入观察者队列 中,这里用了view,所以在构造器中初始化了view
				//new Observer(executeCommand,this);  
				view.registerObserver( notificationName, new Observer( executeCommand, this ) );
			}
			commandMap[ notificationName ] = commandClassRef;
		}
		
		//是否注册了该命令
		public function hasCommand( notificationName:String ) : Boolean
		{
			return commandMap[ notificationName ] != null;
		}
       // 移除命令时要从view中的观察者列表 和自身的命令列表中都移除
		public function removeCommand( notificationName : String ) : void
		{
			// if the Command is registered...
			if ( hasCommand( notificationName ) )
			{
				// remove the observer
				view.removeObserver( notificationName, this );
							
				// remove the command
				commandMap[ notificationName ] = null;
			}
		}
		
		// Local reference to View 
		protected var view : IView;
		
		// 注册的命令列表
		protected var commandMap : Array;

		// Singleton instance
		protected static var instance : IController;

		// Message Constants
		protected const SINGLETON_MSG : String = "Controller Singleton already constructed!";

	}
}