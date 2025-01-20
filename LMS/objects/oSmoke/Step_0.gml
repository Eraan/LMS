//depth = -y;

// Gradually fade out
image_alpha -= 1 / lifetime;
image_angle += .5;

// Increase size
image_scale += 0.01;

// Slow down over time
speed = max(0, speed - 0.005);

// Destroy the particle when fully faded
if (image_alpha <= 0) {
    instance_destroy();
}