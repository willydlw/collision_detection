# Circle Collision

This algorithm calculates the distance between the center points of two circles. There is no collision if the separation distance is less than the sum of the circles' radii.

![circle distance](./circle_collision.png "distance between centers")</br></br>

Figure 1</br></br>

The Pythagorean theorem, c<sup>2</sup> = a<sup>2</sup> + b<sup>2</sup> is used to calculate the distance between the circle center points. 

Let gx,gy represent the green circle center and bx,by represent the blue circle center. The distance between the x points is a = gx - bx. The distance between the y points is b = gy - by. The distance between center points is sqrt(a<sup>2</sup> + b<sup>2</sup>).

Let gr and br represent the radii of the green and blue circles. Our collision pseudcode is

```java
if( c <= (gr + br))
   collision detected
```

Run the [circle](circle.pde) sketch.