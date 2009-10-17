// Author: Leonard Dahlmann 
module gen.LinkedList;

template MLinkedList(T)
{
	//alias typeof(this) T;
	
	T next;
	T previous;
	
	struct LinkedList
	{
	private:
		T _first = null;
		T _last = null;
		uint _length = 0;
		
	public:
		T first() { return _first; }
		T last() { return _last; }
		uint length() { return _length; }
		bool empty() { return _length == 0; }
		
		T attach(T element)
		{
			element.next = element.previous = null;
			
			if(!_first)
				_first = element;
			
			if(_last)
			{
				_last.next = element;
				element.previous = _last;
			}
			
			_last = element;
			_length++;
			
			return element;
		}
		
		T detach(T element)
		{
			if(element.next)
				element.next.previous = element.previous;
			else
				_last = element.previous;
			
			if(element.previous)
				element.previous.next = element.next;
			else
				_first = element.next;
			
			_length--;
			
			return element;
		}
		
		int opApply(int delegate(ref T) dg)
		{
			int result = 0;
			
			auto current = _first;
			while(current)
			{
				if(cast(bool)(result = dg(current)))
					break;
					
				current = current.next;
			}
			
			return result;
		}
	}
}

/+unittest
{	
	struct Container
	{
		mixin MLinkedList!(Container);
		
		int x;
	}

	Container.LinkedList list;
	
	for(int i = 0; i < 10000; i++)
		list.attach(new Container);
}+/
