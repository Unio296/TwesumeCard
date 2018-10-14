$(document).on('turbolinks:load', function() { 

  $('resume_')

  $('#resume_job_type').change(function(){
    $('#item-job_type').text($(this).val());
  });

  $('#resume_location').change(function(){
    $('#item-location').text($(this).val());
  });

  $('#resume_desired_salary').change(function(){
    $('#item-desired_salary').text($(this).val());
  });

  $('#resume_timing').change(function(){
    $('#item-timing').text($(this).val());
  });

  $('#resume_age').change(function(){
    $('#item-age').text($(this).val());
  });

  $('#resume_skills').change(function(){
    $('#item-skills').text($(this).val());
  });

  $('#resume_capacity').change(function(){
    $('#item-capacity').text($(this).val());
  });

  $('#resume_languages').change(function(){
    $('#item-languages').text($(this).val());
  });

  $('#resume_employment_pattern').change(function(){
    $('#item-employment_pattern').text($(this).val());
  });

  $('#resume_note').change(function(){
    $('#item-note').text($(this).val());
  });

document.downloadImage = () => {
    const twesumeElement = document.querySelector('#twesume');
    const canvasElement = document.querySelector('#canvas');
    const linkElement = document.querySelector('#dl-link');

  html2canvas(twesumeElement).then(canvas => {
    canvasElement.src = canvas.toDataURL();
    linkElement.href = canvas.toDataURL('image/png');
    linkElement.download = 'canvas.png';
    linkElement.click();
  });
}
  

});