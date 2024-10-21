control 'fastapi-container-1.0' do
    impact 1.0
    title 'FastAPI Container Compliance Checks'
    desc 'Ensure that the FastAPI container is running and responding'
  
    describe docker_container(name: 'fastapi-app') do
      it { should exist }
      it { should be_running }
    end
  
    describe http('http://localhost:8000/health') do
      its('status') { should cmp 200 }
      its('body') { should cmp '{"status":"Healthy"}' }
    end
  end