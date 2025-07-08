# 📝 To-Do App en Flutter V1.0

Una aplicación móvil desarrollada en Flutter para gestionar una lista de tareas (To-Do List), con persistencia de datos local y manejo eficiente del estado utilizando **Riverpod**.

---

## 🚀 Funcionalidades

- Ver todas las tareas almacenadas.
- Agregar nuevas tareas.
- Editar tareas existentes.
- Marcar tareas como completadas.
- Eliminar tareas.
- Persistencia de datos local (con `sqflite`).
- Manejo de estado reactivo con `flutter_riverpod`.

---

## 🧱 Tecnologías y Paquetes Usados

- **Flutter**: Framework UI principal.
- **Riverpod**: Gestión de estado escalable y reactiva.
- **Sqflite**: Almacenamiento local en SQLite.
- **Path Provider**: Acceso a rutas locales del dispositivo.

---

## 📁 Estructura del Proyecto

lib/  
├── main.dart                    # Punto de entrada de la aplicación  
├── models/  
│   └── task.dart               # Modelo de datos Task  
├── data/  
│   └── task_database.dart      # Lógica de persistencia con SQLite  
├── providers/  
│   └── task_provider.dart      # Gestión de estado con Riverpod  
├── views/  
│   ├── task_list_screen.dart   # Pantalla principal con lista de tareas  
│   └── task_form_screen.dart   # Pantalla para agregar/editar tareas  
├── widgets/  
│   └── task_item.dart          # (Opcional) Widgets reutilizables  

---

## ⚙️ Instalación y Ejecución

1. Clona el repositorio:

```bash
git clone https://github.com/tuusuario/flutter-todo-app.git
cd flutter-todo-app
```