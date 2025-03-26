class Player { [string]$Name; [Position]$Position; [string] ToString() { return $this.Name + " (" + $this.Position + ")" } }
class Position { [int]$X; [int]$Y; [string] ToString() { return "" + $this.X + ", " + $this.Y } }
enum Direction { North; East; South; West }

[Player]$Player = @{
    Name     = "Player One"
    Position = @{
        X = 3
        Y = 5
    }
}