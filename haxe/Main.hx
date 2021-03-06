class Main extends hxd.App{
    var bmp : h2d.Bitmap;
    var velocity : Float = 0;
    var gravity : Float = 9.8;

    var chunkSize : Float = 100;

    override function init() {
        // create a colored texture + create a 100x100 tile
        var tile = h2d.Tile.fromColor(0x36d456, 100, 100);
        tile.dx = -tile.width * 0.5;
        tile.dy = -tile.height * 0.5;

        // create a bitmap object, add it to the default 2d scene (s2d)
        bmp = new h2d.Bitmap(tile, s2d);

        // modify the display position of bitmap
        bmp.x = s2d.width * 0.5;
        bmp.y = s2d.height * 0.5;
    }

    // dt = delta time, time between frames
    // dt = t1-t0 != 1s.
    override function update(dt:Float) {
        bmp.y += velocity * chunkSize * dt;
        velocity += gravity * dt;

        if(bmp.y + bmp.tile.y / 2 > s2d.height){
            velocity = -velocity;
        }
    }

    static function main() {
        new Main();
    }
}
