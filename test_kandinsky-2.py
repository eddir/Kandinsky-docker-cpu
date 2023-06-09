from kandinsky2 import get_kandinsky2

model = get_kandinsky2('cpu', task_type='text2img', model_version='2.1', use_flash_attention=False)
images = model.generate_text2img(
    "red cat, 4k photo",
    num_steps=100,
    batch_size=1,
    guidance_scale=4,
    h=768, w=768,
    sampler='p_sampler',
    prior_cf_scale=4,
    prior_steps="5"
)

#save images
for i, image in enumerate(images):
    image.save(f"result{i}.png")
