#include "egpch.h"

#include "Application.h"
#include "Log.h"
#include "Events/Event.h"

#include "Events/ApplicationEvent.h"

namespace Engine {
	Application::Application() {
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application() {

	}

	void Application::Run() {
		while (m_Running) 
		{
			m_Window->OnUpdate();
		}
	}
};