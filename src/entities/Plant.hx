package entities;
import com.haxepunk.graphics.Image;
import com.matttuttle.PhysicsEntity;

/**
 * ...
 * @author Pumpkin Eater
 */

class Plant extends PhysicsEntity
{
    private var _plant_sprite: Image;
	private var _pointX: Float;
	private var _pointY: Float;
	private var _shoot: Bool = false;
	private var scaleFactor:Float = 0.5;

	public function new(x:Float, y:Float, image:String) 
	{
		super(x, y);
		
		_plant_sprite = new Image("gfx/"+image);
		_plant_sprite.scale = scaleFactor;
        
		graphic = _plant_sprite;
		
		layer = 1;
		
		gravity.y = 0.5;
        maxVelocity.y = 1.1;
        maxVelocity.x = 1.5;
        friction.x = 1;
        friction.y = 0;
		
		type = CollisionType.PLANT;
		
		setHitbox( Std.int( _plant_sprite.width * scaleFactor ), Std.int( _plant_sprite.height * scaleFactor ) );
	}
	
	// set velocity based on keyboard input
    private function handleInput()
    {
		
    }
	
	//Set the animation based on 
	private function setAnimations()
    {
		if ( collide( CollisionType.FURNACE , x , y ) != null )
		{	
			var player:Player = cast(collide( CollisionType.PLAYER , x , y ), Player);
			
			if (player != null ) {
				player._equiped = false;
			}
			trace ("The Plant has been slaughtered for dinner!");
			destroy();
		}
    }
	
	public function setCords(newX, newY)
    {   
		x = newX + 10.0;
		y = newY;
    }	
	
	public override function update()
    {   
        super.update();
        
		handleInput();
        
        setAnimations( );
		
    }
	public function destroy()
	{
		world.remove(this);
	}
	
}