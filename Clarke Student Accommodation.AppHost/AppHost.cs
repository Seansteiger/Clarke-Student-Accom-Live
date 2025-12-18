var builder = DistributedApplication.CreateBuilder(args);

builder.AddProject<Projects.Clarke_Student_Accommodation>("clarke-student-accommodation");

builder.Build().Run();
