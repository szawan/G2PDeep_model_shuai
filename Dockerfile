# Use a more complete base image
FROM python:3.6

# Install necessary system packages
RUN apt-get update -q && apt-get install -y \
    default-libmysqlclient-dev \
    gcc

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirement.txt

# Run train.py when the container launches
CMD ["python", "train.py", "--data_dir", "./data/SoyNAM", "--result_dir", "./results", "--dataset_type", "height"]
