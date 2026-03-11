class Client {
  String name;
  int clientID;
  String email;
  String phone;
  String companyName;
  List<Project> projectsForClient = [];

  Client(this.name, this.clientID, this.email, this.phone, this.companyName);

  void addProject(Project project) {
    projectsForClient.add(project);
  }


  void getProjects() {
  print('Projects for $name:');
  for (var project in projectsForClient) {
    print('- ${project.projectName}');
  }


  }

  void updateContactInfo(String newEmail, String newPhone) {
    email = newEmail;
    phone = newPhone;
    print('Updated Contact Info: \n New phone: $newPhone \n New Email: $newEmail');
  }
}

class Employee {
  String name;
  int employeeID;
  String email;
  String phone;
  String position;
  Department? department;
  List<Tasks> assignedTasks = [];

  Employee(this.name, this.employeeID, this.email, this.phone, this.position, this.department);

  void assignTask(Tasks task) {
    assignedTasks.add(task);
  }

  void getTasks() {
    print('Tasks for $name: ${assignedTasks.map((t) => t.title).toList()}');
  }

  void updatePosition(String newPosition) {
    position = newPosition;
    print('New Position: $newPosition');
  }
}

class Department {
  int departmentID;
  String departmentName;
  List<Employee> employees = [];
  List<Project> projects = [];

  Department(this.departmentID, this.departmentName);

  void addEmployee(Employee emp) {
    employees.add(emp);
    print('Employee ${emp.name} added to department $departmentName');
  }

  void removeEmployee(Employee emp) {
    employees.remove(emp);
    print('Employee ${emp.name} removed from department $departmentName');
  }

  void getProjects() {
    print('Projects for $departmentName: ${projects.map((p) => p.projectName).toList()}');
  }
}

class Tasks {
  int taskID;
  String title;
  String description;
  Employee? assignedTo;
  DateTime dueDate;
  String status;
  String priority;

  Tasks(this.taskID, this.title, this.description, this.assignedTo, this.dueDate, this.status, this.priority);

  void updateStatus(String newStatus) {
    status = newStatus;
    print('Task "$title" status updated to $newStatus');
  }

  void assignTo(Employee emp) {
    assignedTo = emp;
    print('Task "$title" assigned to ${emp.name}');
  }

  void updateDescription(String newDescription) {
    description = newDescription;
    print('Task "$title" description updated');
  }
}

class Project {
  int projectID;
  String projectName;
  Client client;
  String statusProject;
  List<Tasks> tasks = [];
  DateTime startDate;
  DateTime endDate;
  List<Employee> assignedEmployees = [];

  Project(this.projectID, this.projectName, this.client, this.statusProject, this.startDate, this.endDate);

  void addTask(Tasks task) {
    tasks.add(task);
    print('Task "${task.title}" added to project "$projectName"');
  }

  void getTasks() {
    print('Tasks for project "$projectName": ${tasks.map((t) => t.title).toList()}');
  }

  void updateStatus(String newStatus) {
    statusProject = newStatus;
    print('Project "$projectName" status updated to $newStatus');
  }

  void assignEmployee(Employee emp) {
    assignedEmployees.add(emp);
    print('Employee ${emp.name} assigned to project "$projectName"');
  }
}

void main() {
  // objects 
  Client client1 = Client("Ahmed", 101, "ahmed@example.com", "0123456789", "Tech Corp");
  Employee emp1 = Employee("Sara", 201, "sara@example.com", "01122334455", "Developer", null);
  Employee emp2 = Employee("Ali", 202, "ali@example.com", "01555667788", "Designer", null);
  Department dept1 = Department(1, "IT Department");
  Project project1 = Project(301, "New App", client1, "In Progress", DateTime(2025, 1, 1), DateTime(2025, 6, 1));
  Tasks task1 = Tasks(401, "Design UI", "Create user interface for the app", emp2, DateTime(2025, 3, 1), "Pending", "High");
  
  // إضافة المشروع للعميل
  client1.addProject(project1);
  client1.getProjects();
  
  // تحديث بيانات العميل
  client1.updateContactInfo("ahmed.new@example.com", "01012345678");
  
  // إضافة الموظفين للقسم
  dept1.addEmployee(emp1);
  dept1.addEmployee(emp2);
  dept1.getProjects();
  
  // تحديد المهام
  emp2.assignTask(task1);
  emp2.getTasks();
  
  // تحديث حالة المهمة
  task1.updateStatus("Completed");
  
  // إضافة المهام للمشروع
  project1.addTask(task1);
  project1.getTasks();
  
  // تحديث حالة المشروع
  project1.updateStatus("Completed");
  
  // إسناد الموظفين للمشروع
  project1.assignEmployee(emp1);
  project1.assignEmployee(emp2);
}