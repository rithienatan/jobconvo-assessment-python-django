from rest_framework.decorators import api_view # type: ignore
from rest_framework.response import Response # type: ignore
from django.http import HttpRequest,  HttpResponse


@api_view(['GET'])
def health(request: HttpRequest) -> HttpResponse:
    """Simple health endpoint."""
    return Response({'status': 'ok'})
