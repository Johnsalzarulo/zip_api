[![Build Status](https://semaphoreci.com/api/v1/projects/7b5219ee-1ef9-4f6b-9873-36e34cc65502/2504972/badge.svg)](https://semaphoreci.com/better/zip_api)

## Overview

This API endpoint provides a simple lookup of data from a given valid zip code.

### Example Usage

Informational GET Endpoint:

```
GET: http://zip-lookup.herokuapp.com/searches
```

Example Return:

```
  {"message":"Welcome to the API 🚀 - Your main point of interaction will be sending a POST request to the /searches endpoint with a zip code in the params - for more info visit: https://github.com/Johnsalzarulo/zip_api"}
```

POST Endpoint:

```
POST: http://zip-lookup.herokuapp.com/searches?zip=93001
```

Example Return:

```
{
    "data": {
        "ZIP": "93001",
        "CBSA": "37100",
        "MSA": "Oxnard-Thousand Oaks-Ventura, CA",
        "Pop2015": "850536",
        "Pop2014": "846119"
    }
}
```

Example Failure:

```
POST: http://zip-lookup.herokuapp.com/searches?zip=123
```

```
{
    "errors": [
        "Zip code Invalid - 5 digits only please"
    ]
}
```

## Implementation

This API uses 3 main components to handle the requests:

### `Search` Query Object

- Responsible for Validation
- Used by the Searches controller
- Keeps the controller clean

### `ZipService`

- Responsible for calling the static CSV that's on the server
- Allows for a clean abstraction in which data can be queried and cleaned.

### `CbsaService`

- Responsible for matching the found CBSA codes from initial searches
- Also handles the "re-lookup" when initial search isn't found.

## Testing

- A standard 'rails test' command will run the test suite
- CLI integrated to ensure there's no breaking changes.
- Tests cover all required cases from spec and additionally cover validation.

Current Build Status: [![Build Status](https://semaphoreci.com/api/v1/projects/7b5219ee-1ef9-4f6b-9873-36e34cc65502/2504972/badge.svg)](https://semaphoreci.com/better/zip_api)
