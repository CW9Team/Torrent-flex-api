from rest_framework.views import APIView
from rest_framework.response import Response

# This class likely represents a view in a Python web application that performs health checks.
class HealthCheck(APIView):
    def get(self, requet):
        return Response({"status": "ok"}, status=200)