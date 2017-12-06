#version 330

uniform sampler2DRect sampler_world_position;
uniform sampler2DRect sampler_world_normal;

uniform vec3 light_direction;
uniform float light_intensity = 0.5f;

out vec3 reflected_light;

vec3 DirectionalLight(vec3 normal, vec3 direction);

void main(void)
{
	vec3 ambient_light = vec3(0.1f, 0.1f, 0.1f);
    reflected_light = vec3(1.0, 0.33, 0.0f);

	ivec2 fragCoord = ivec2(gl_FragCoord.xy);

	vec3 position = texelFetch(sampler_world_position, fragCoord).xyz;
	vec3 normal = texelFetch(sampler_world_normal, fragCoord).xyz;

	normal = normalize(normal);

	vec3 colour = ambient_light;

	colour = DirectionalLight(normal, light_direction);

	reflected_light = colour;


}

vec3 DirectionalLight(vec3 normal, vec3 direction)
{
	float scale = max(0, dot(normalize(normal), direction));

	vec3 intensity = vec3(light_intensity, light_intensity, light_intensity)*scale;

	return intensity;
}
