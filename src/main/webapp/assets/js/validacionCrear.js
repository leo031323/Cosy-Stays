// Create validation for creating published forms in the MultistepForm.jsp view
const form = document.getElementById('form');

form.addEventListener('submit', (e) => {

        const type = document.getElementById('inputType');
        const street = document.getElementById('inputStreet');
        const height = document.getElementById('inputRentPublication');
        const province = document.getElementById('inputProvince');
        const city = document.getElementById('inputCity');
        const latitude = document.getElementById('latitud');
        const longitude = document.getElementById('longitud');
        const environment = document.getElementById('inputLivingRoom');
        const bedrooms = document.getElementById('inputBedroom');
        const bathrooms = document.getElementById('inputBathroom');
        const garage = document.getElementById('inputGarage');
        const coveredArea = document.getElementById('inputSurfaceCoverage');
        const totalArea = document.getElementById('inputSurfaceTotal');
        const price = document.getElementById('inputPrice');
        const title = document.getElementById('inputTitle');
        const description = document.getElementById('inputDescription');
        const images = document.getElementById('input-file');




    e.preventDefault();

    let errores = 0;
    // checkInputs();
    document.getElementById('divRent').innerText = '';
    document.getElementById('divType').innerText = '';
    document.getElementById('divStreet').innerText = '';
    document.getElementById('divProvince').innerText = '';
    document.getElementById('divCiudad').innerText = '';
    document.getElementById('divMap').innerText = '';
    document.getElementById('divLivingRoom').innerText = '';
    document.getElementById('divBedroom').innerText = '';
    document.getElementById('divBathroom').innerText = '';
    document.getElementById('divGarage').innerText = '';
    document.getElementById('divSurfaceCoverage').innerText = '';
    document.getElementById('divSurfaceTotal').innerText = '';
    document.getElementById('divPrice').innerText = '';
    document.getElementById('divTitle').innerText = '';
    document.getElementById('divDescription').innerText = '';
    document.getElementById('divImages').innerText = '';

    document.getElementById('progressType').className = 'multisteps-form__progress-btn js-active';
    document.getElementById('progressLocation').className = 'multisteps-form__progress-btn';
    document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn';
    document.getElementById('progressImage').className = 'multisteps-form__progress-btn';
    document.getElementById('progressAmenity').className = 'multisteps-form__progress-btn';




    if (type.value === '') {
        document.getElementById('divType').innerText = 'Property type must be selected';
        document.getElementById('progressType').className = 'multisteps-form__progress-btn js-active text-danger';
        errores++;
    }

    if(street.value === '') {
        document.getElementById('divStreet').innerText = 'Must enter the street';
        document.getElementById('progressLocation').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }else {
        if (street.value.length > 100) {
            document.getElementById('divStreet').innerText = 'Street names must be less than 100 characters long';
            document.getElementById('progressLocation').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
    }

    if(height.value === '') {
        document.getElementById('divRent').innerText = 'Height is mandatory';
        document.getElementById('progressLocation').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }

    if(province.value === '') {
        document.getElementById('divProvince').innerText = 'You must select a province';
        document.getElementById('progressLocation').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }

    if(city.value === '') {
        document.getElementById('divCiudad').innerText = 'You must select a city';
        document.getElementById('progressLocation').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }

    if(latitude.value === '' || longitude.value === '') {
        document.getElementById('divMap').innerText = 'You must select a location on the map';
        document.getElementById('progressLocation').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }

    if(environment.value !== '' || environment.value !== '0') {
        if(environment.value < 0) {
            document.getElementById('divLivingRoom').innerText = 'Positive value must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(environment.value > 99) {
            document.getElementById('divLivingRoom').innerText = 'A value less than 100 must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }

    }

    if(bedrooms.value !== '' || bedrooms.value !== '0') {
        if(bedrooms.value < 0) {
            document.getElementById('divBedroom').innerText = 'Positive value must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(bedrooms.value > 99) {
            document.getElementById('divBedroom').innerText = 'A value less than 100 must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }

    }

    if(bathrooms.value !== '' || bathrooms.value !== '0') {
        if(bathrooms.value < 0) {
            document.getElementById('divBathroom').innerText = 'Positive value must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(bathrooms.value > 99) {
            document.getElementById('divBathroom').innerText = 'A value less than 100 must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }

    }

    if(garage.value !== '' || garage.value !== '0') {
        if(garage.value < 0) {
            document.getElementById('divGarage').innerText = 'Positive value must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(garage.value > 99) {
            document.getElementById('divGarage').innerText = 'A value less than 100 must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }

    }

    if(coveredArea.value !== '' || coveredArea.value !== '0') {
        if(coveredArea.value < 0) {
            document.getElementById('divSurfaceCoverage').innerText = 'Positive value must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(coveredArea.value > 999999) {
            document.getElementById('divSurfaceCoverage').innerText = 'You must enter a value less than 9999999';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }

    }

    if(totalArea.value !== '' || totalArea.value !== '0') {
        if(totalArea.value < 0) {
            document.getElementById('divSurfaceTotal').innerText = 'Positive value must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(totalArea.value > 999999) {
            document.getElementById('divSurfaceTotal').innerText = 'You must enter a value less than 9999999';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(totalArea.value < coveredArea.value) {
            document.getElementById('divSurfaceTotal').innerText = 'The total area must be greater than the covered area';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }

    }

    if(price.value === '') {
        document.getElementById('divPrice').innerText = 'The price of the property must be entered';
        document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }else {
        if(price.value < 0) {
            document.getElementById('divPrice').innerText = 'Positive value must be entered';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(price.value > 999999999) {
            document.getElementById('divPrice').innerText = 'Must enter a value less than 99999999';
            document.getElementById('progressCharacteristic').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }

    }

    if(title.value === '') {
        document.getElementById('divTitle').innerText = 'The title of the attribute must be entered';
        document.getElementById('progressImage').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }else {
        if(title.value.length > 50) {
            document.getElementById('divTitle').innerText = 'The title should not exceed 50 characters';
            document.getElementById('progressImage').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
    }

    if(description.value === '') {
        document.getElementById('divDescription').innerText = 'A description of the property must be entered';
        document.getElementById('progressImage').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }else {
        if(description.value.length < 50) {
            document.getElementById('divDescription').innerText = 'The description must be at least 50 characters long';
            document.getElementById('progressImage').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
        if(description.value.length > 500) {
            document.getElementById('divDescription').innerText = 'The description must be less than 500 characters';
            document.getElementById('progressImage').className = 'multisteps-form__progress-btn text-danger';
            errores++;
        }
    }

    if(images.value === '') {
        document.getElementById('divImages').innerText = 'You must input at least one image';
        document.getElementById('progressImage').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }

    // If the number of images is greater than 6, an error occurs
    if(images.files.length > 6) {
        document.getElementById('divImages').innerText = 'You must input a maximum of 6 images';
        document.getElementById('progressImage').className = 'multisteps-form__progress-btn text-danger';
        errores++;
    }

    // If there are no errors, send the form
    if(errores === 0) {
        document.getElementById('form').submit();
    }else {
        alert('Have ' + errores +  ' Errors in the table');
    }
}
);


