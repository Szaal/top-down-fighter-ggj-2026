// Gradually decrease alpha
image_alpha -= 0.05; 

// When it becomes invisible, delete it from memory
if (image_alpha <= 0) 
{
    instance_destroy();
}