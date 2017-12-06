#version 330

uniform sampler2DRect sampler_world_position;
uniform sampler2DRect sampler_world_normal;

uniform vec3 point_light_position;
uniform float point_light_range;

out vec3 reflected_light;

vec3 position;
vec3 normal;

vec3 pointLightCalc();

void main(void)
{
    reflected_light = vec3(0.1f, 0.1f, 0.1f);

	ivec2 fragCoord = ivec2(gl_FragCoord.xy);

	position = texelFetch(sampler_world_position, fragCoord).xyz;
	normal = texelFetch(sampler_world_normal, fragCoord).xyz;

	normal = normalize(normal);

	vec3 colour = pointLightCalc();
	reflected_light = colour;
}

vec3 pointLightCalc()
{
	float point_light_distanceX = point_light_position.x - position.x;
	float point_light_distanceY = point_light_position.y - position.y;
	float point_light_distanceZ = point_light_position.z - position.z;

	float point_light_distance = (point_light_distanceX * point_light_distanceX) + (point_light_distanceY * point_light_distanceY) + (point_light_distanceZ * point_light_distanceZ);

	float attenuation = 1.0f / (1.0f + 0.001f * point_light_distance);

	vec3 L = normalize(point_light_position - position);
	float point_light_power = point_light_range/50;
	vec3 point_light_colour = vec3(1.0f, 0.0f, 0.0f);
	float cosTheta = clamp(dot(normal, L), 0, 1);

	vec3 colour = point_light_colour * point_light_power * cosTheta * attenuation;

	return colour;
}