# 2D Collision Detection Between Circle and Rectangle

Objective: Write a program to detect when a circle and a rectangle collide.</br></br>


## Check Circle Rectangle Intersection

Let (Rx, Ry) represent the upper left corner of a rectangle. 

Let rwidth, rheight reprsent the rectangle's width and height.

Let rad, Xc, Yc represent the circle's radius, center x coordinate, and center y coordinate, respectively.</br></br>

Does a point of intersection, P, exist that belongs to both the circle and the rectangle?  

**Case 1**: The side of the rectangle touches or intersects the circle.  

**Case 2**: The circle lies inside the rectangle.</br></br>

### Solution

1. Find Rectangle points closest to Circle's center

```cpp
// Is the rectangle's right edge or left edge closer to Xc?

if(Xc < Rx){
  Xclosest = Rx               // left edge
} 
else if (Xc > Rx + rwidth)
{
   Xclosest = Rx + rwidth     // right edge
} 
else{
   Xclosest = Xc              // circle center at Rx
} 

// Is the rectangle's top edge or bottom edge closer to Yc?
if(Yc < Ry)
{
   Yclosest = Ry           // top edge
} 
else if(Yc > Ry + rheight)
{
   Yclosest = Ry + rheight // bottom edge
} 
else
{
   Yclosest = Yc       // circle center on rect edge
} 
```

2. Find Distance between nearest point and Circle Center

```cpp
// Find distance from closest edges
dx = Xclosest - Xcenter
dy = Yclosest - Ycenter
distance = sqrt( dx*dx + dy*dy)
```

3. Collision?

```cpp
// if distance is less than or equal than circle radius, there is a collision
if(distance <= rad)
{
   collision = true
}
else
{
   collision = false
}
``` 

</br></br>