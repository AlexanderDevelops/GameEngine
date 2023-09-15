#include "egpch.h"

#include "Application.h"
#include "Log.h"
#include "Events/Event.h"

#include "Events/ApplicationEvent.h"
#include "Events/MouseEvent.h"

namespace Engine {
	Application::Application() {

	}

	Application::~Application() {

	}

	void Application::Run() {
		WindowResizeEvent e(1280, 720);
		EG_TRACE(e);
		MouseMovedEvent g(100, 100);
		EG_WARN(g);

		while (true);
	}
};