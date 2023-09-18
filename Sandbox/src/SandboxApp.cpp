#include "Engine.h"

#include "imgui/imgui.h"

#include "imgui/examples/imgui_impl_opengl3.h"
#include "imgui/examples/imgui_impl_glfw.h"

class ExampleLayer : public Engine::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}
	
	void OnUpdate() override 
	{
		if (Engine::Input::IsKeyPressed(69))
			EG_TRACE("Key E is being pressed down.");
	}

	virtual void OnImGuiRender() override
	{
		ImGui::Begin("Test");
		ImGui::Text("Hello, world!");
		ImGui::End();
	}

	void OnEvent(Engine::Event& event) override
	{
	}
};

class Sandbox : public Engine::Application
{
public:
	Sandbox() {
		PushLayer(new ExampleLayer());
	}

	~Sandbox() {

	}
};

Engine::Application* Engine::CreateApplication() {
	return new Sandbox();
};