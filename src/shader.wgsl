// Vertex shader

struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) color: vec3<f32>,
};

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) color: vec3<f32>,
    @location(1) uv: vec2<f32>,
}

@vertex
fn vs_main(
    model: VertexInput
) -> VertexOutput {
    var out: VertexOutput;

    out.clip_position = vec4<f32>(model.position, 1.0);
    out.color = model.color;
    out.uv = out.clip_position.xy;
    
    return out;
}

// Fragment shader

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    var uv: vec2<f32> = in.uv;

    var angle: f32 = atan2(uv.y,uv.x);
    var a_multi: f32 = 0.0;
    var radius: f32 = length(uv);
    var r_multi: f32 = 100.0;

    var arg_value = radius * r_multi - angle * a_multi;
    var spiral = cos(arg_value);

    var uv_2: vec2<f32>  = 0.5 - in.uv * 2.0;
    var r: f32 = uv_2.y + 0.1;
    var g: f32 = uv_2.x-0.11;
    var b: f32 = 1.0 - (r+g)*0.5;
    var temp_color: vec4<f32> = vec4<f32>(r, g, b, 1.0);

    var model_color: vec3<f32> = in.color * spiral * 0.5;
    return temp_color - vec4<f32>(model_color,1.0) * 0.3;
}
