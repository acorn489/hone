export default class NewRegistration {
  constructor() {
    $("#developerForm").hide();
    var country;
    $("#user_type input").on('change', function() {
      var user_type = $('input[name="type"]:checked').val();
      if (user_type == "student") {
        $("#studentForm").show();
        $("#developerForm").hide();
        if (country !== null) {
          $("#user_country").val(country);
        }
        $("#developerForm")[0].reset();
      } else {
        $("#studentForm").hide();
        country = $("#user_country").val();
        $("#studentForm")[0].reset();
        $("#developerForm").show();
      }
    });
    $("#user_country").countrySelect();
    var allCountries = [
      "English",
      "Abkhaz",
      "Adyghe",
      "Afrikaans",
      "Akan",
      "Albanian",
      "Amharic",
      "Arabic",
      "Aragonese",
      "Aramaic",
      "Armenian",
      "Aymara",
      "Balinese",
      "Basque",
      "Betawi",
      "Bosnian",
      "Breton",
      "Bulgarian",
      "Cantonese",
      "Catalan",
      "Cherokee",
      "Chickasaw",
      "Chinese",
      "Coptic",
      "Cornish",
      "Corsican",
      "Crimean Tatar",
      "Croatian",
      "Czech",
      "Danish",
      "Dutch",
      "Dawro",
      "Esperanto",
      "Estonian",
      "Ewe",
      "Fiji Hindi",
      "Filipino",
      "Finnish",
      "French",
      "Galician",
      "Georgian",
      "German",
      "Greek, Modern",
      "Ancient Greek",
      "Greenlandic",
      "Haitian Creole",
      "Hawaiian",
      "Hebrew",
      "Hindi",
      "Hungarian",
      "Icelandic",
      "Indonesian",
      "Inuktitut",
      "Interlingua",
      "Irish",
      "Italian",
      "Japanese",
      "Kabardian",
      "Kannada",
      "Kashubian",
      "Khmer",
      "Kinyarwanda",
      "Korean",
      "Kurdish/Kurdî",
      "Ladin",
      "Latgalian",
      "Latin",
      "Lingala",
      "Livonian",
      "Lojban",
      "Lower Sorbian",
      "Low German",
      "Macedonian",
      "Malay",
      "Malayalam",
      "Mandarin",
      "Manx",
      "Maori",
      "Mauritian Creole",
      "Min Nan",
      "Mongolian",
      "Norwegian",
      "Old Armenian",
      "Old English",
      "Old French",
      "Old Norse",
      "Old Prussian",
      "Oriya",
      "Pangasinan",
      "Papiamentu",
      "Pashto",
      "Persian",
      "Pitjantjatjara",
      "Polish",
      "Portuguese",
      "Proto-Slavic",
      "Quenya",
      "Rapa Nui",
      "Romanian",
      "Russian",
      "Sanskrit",
      "Scots",
      "Scottish Gaelic",
      "Serbian",
      "Serbo-Croatian",
      "Slovak",
      "Slovene",
      "Spanish",
      "Sinhalese",
      "Swahili",
      "Swedish",
      "Tagalog",
      "Tajik",
      "Tamil",
      "Tarantino",
      "Telugu",
      "Thai",
      "Tok Pisin",
      "Turkish",
      "Twi",
      "Ukrainian",
      "Upper Sorbian",
      "Urdu",
      "Uzbek",
      "Venetian",
      "Vietnamese",
      "Vilamovian",
      "Volapük",
      "Võro",
      "Welsh",
      "Xhosa",
      "Yiddish"
    ];
    $.each(allCountries, function(index, value) {
      $('.language').append($('<option/>', {
        value: value,
        text: value
      }));
    });

    $("#datepicker").datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: 'yy-mm-dd',
      yearRange: '-16y:c+nn',
      maxDate: '-6y:c+nn'
    });
  }
}
