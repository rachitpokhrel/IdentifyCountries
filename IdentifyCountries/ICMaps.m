//
//  ICMaps.m
//  IdentifyCountries
//
//  Created by Rachit on 10/29/15.
//  Copyright © 2015 Rachit. All rights reserved.
//

#import "ICMaps.h"

@interface ICMaps()
@property (nonatomic, strong) NSMutableSet *alreadyAsked;
@property (nonatomic, strong) NSArray *regions;

@end

@implementation ICMaps

-(NSArray *)countries
{
    if (!_countries) {
        _countries = @[[self Afganistan],
                       [self Albania],
                       [self Algeria],
                       [self Angola],
                       [self Argentina],
                       [self Armenia],
                       [self Australia],
                       [self Austria],
                       [self Azerbaijan],
                       [self Bangladesh],
                       [self Belarus],
                       [self Belgium],
                       [self Belize],
                       [self Benin],
                       [self Bhutan],
                       [self Bolivia],
                       [self Bosnia],
                       [self Botswana],
                       [self Brazil],
                       [self Brunei],
                       [self Bulgaria],
                       [self BurkinaFaso],
                       [self Burundi],
                       [self Cambodia],
                       [self Cameroon],
                       [self Canada],
                       [self CentralAfricanRepublic],
                       [self Chad],
                       [self Chile],
                       [self Chile],
                       [self Columbia],
                       [self Congo],
                       [self CostaRica],
                       [self Croatia],
                       [self Cuba],
                       [self Cyprus],
                       [self CzechRepublic],
                       [self DemocraticRepublicOfCongo],
                       [self Denmark],
                       [self Djibauti],
                       [self DominicanRepublic],
                       [self Egypt],
                       [self ElSalvador],
                       [self Equador],
                       [self EquiterialGuinea],
                       [self Eritrea],
                       [self Estonia],
                       [self Ethiopia],
                       [self Finland],
                       [self France],
                       [self FrenchGuyana],
                       [self Gabon],
                       [self Georgia],
                       [self Germany],
                       [self Ghana],
                       [self Greece],
                       [self Guatemala],
                       [self GuineaBissau],
                       [self Guinea],
                       [self Guyana],
                       [self Haiti],
                       [self Honduras],
                       [self Hungary],
                       [self Iceland],
                       [self India],
                       [self Indonesia],
                       [self Iran],
                       [self Iraq],
                       [self Ireland],
                       [self Israel],
                       [self Italy],
                       [self IvoryCoast],
                       [self Jamaica],
                       [self Japan],
                       [self Jordan],
                       [self Kazakhstan],
                       [self Kenya],
                       [self Kuwait],
                       [self Kyrgystan],
                       [self Laos],
                       [self Latvia],
                       [self Lebanon],
                       [self Liberia],
                       [self Libya],
                       [self Lithuania],
                       [self Macadonia],
                       [self Madagascar],
                       [self Malawi],
                       [self Malaysia],
                       [self Mali],
                       [self Mauritania],
                       [self Mexico],
                       [self Moldova],
                       [self Mongolia],
                       [self Morocco],
                       [self Mozambique],
                       [self Myanmar],
                       [self Namibia],
                       [self Nepal],
                       [self Netherlands],
                       [self NewZealand],
                       [self Nicaragua],
                       [self Niger],
                       [self Nigeria],
                       [self NorthKorea],
                       [self Norway],
                       [self Oman],
                       [self Pakistan],
                       [self Panama],
                       [self PapuaNewGuinea],
                       [self Paraguay],
                       [self Peru],
                       [self Phillipines],
                       [self Poland],
                       [self Portugal],
                       [self Qatar],
                       [self Rawanda],
                       [self Romania],
                       [self Russia],
                       [self SaudiArabia],
                       [self Senegal],
                       [self Serbia],
                       [self SierraLeone],
                       [self Slovakia],
                       [self Slovenia],
                       [self Somalia],
                       [self SouthAfrica],
                       [self SouthKorea],
                       [self SouthSudan],
                       [self Spain],
                       [self SriLanka],
                       [self Sudan],
                       [self Surinam],
                       [self Sweden],
                       [self Switzerland],
                       [self Syria],
                       [self Taiwan],
                       [self Tajikistan],
                       [self Tanzania],
                       [self Thailand],
                       [self TheGambia],
                       [self Togo],
                       [self Tunisia],
                       [self Turkey],
                       [self Turkmenistan],
                       [self UAE],
                       [self Uganda],
                       [self Ukraine],
                       [self UnitedKingdom],
                       [self Uruguay],
                       [self USA],
                       [self Uzbekistan],
                       [self Venezuela],
                       [self Vietnam],
                       [self Yemen],
                       [self Zambia],
                       [self Zimbabwe]];
    }
    return _countries;
}

-(NSArray *)oceans
{
    if (!_oceans){
        _oceans = @[[self AtlanticOcean],
                    [self BlackSea],
                    [self CaspianSea],
                    [self IndianOcean],
                    [self PacificOcean],
                    [self SeaOfJapan],
                    [self SouthChinaSea]];
    }
    return _oceans;
}

#pragma mark Regions

-(NSArray*)regions
{
    if (!_regions){
        _regions = @[[self NorthAmerica],
                     [self CentralAmerica],
                     [self NorthenSouthAmerica],
                     [self WesternSouthAmerica],
                     [self SouthernSouthAmerica],
                     [self SouthernAfrica],
                     [self SouthCentralAfrica],
                     [self CentralAfrica],
                     [self EastAfrica],
                     [self NorthAfrica],
                     [self NileAfrica],
                     [self WestAfrica],
                     [self WesternEurope],
                     [self EasternEurope],
                     [self Scandinavia],
                     [self Balkans],
                     [self MiddleEast],
                     [self CentralAsia],
                     [self ArabianPeninsula],
                     [self SouthAsia],
                     [self IndoChina],
                     [self FarEast],
                     [self Australasia]];
    }
    return _regions;
}

-(NSMutableSet *)alreadyAsked
{
    if (!_alreadyAsked)
    {
        _alreadyAsked = [[NSMutableSet alloc] init];
    }
    return _alreadyAsked;
}

-(NSArray *)randomRegion
{
    NSMutableSet *regions = [NSMutableSet setWithArray:self.regions];
    [regions minusSet:self.alreadyAsked];
    NSArray *remainingRegions = [NSArray arrayWithArray:[regions allObjects]];
    u_int32_t length = (u_int32_t)remainingRegions.count;
    NSUInteger randomRegion = arc4random_uniform(length);
    [self.alreadyAsked addObject:remainingRegions[randomRegion]];
    _randomRegion = remainingRegions[randomRegion];
    return _randomRegion;
}

-(NSArray*)NorthAmerica
{
    return @[@[[self Canada], [self USA], [self Mexico]],
             @[[self AtlanticOcean], [self PacificOcean]]];
}

-(NSArray*)CentralAmerica
{
    return @[@[[self CostaRica], [self Nicaragua], [self Belize],[self Panama], [self Guatemala], [self Honduras], [self ElSalvador],[self Cuba],[self Haiti],[self DominicanRepublic],[self Jamaica]],
             @[[self AtlanticOcean], [self PacificOcean]]];
}

-(NSArray*)NorthenSouthAmerica
{
    return @[@[[self Columbia], [self Venezuela], [ self Guyana], [self Surinam], [self FrenchGuyana]],@[[self AtlanticOcean], [ self PacificOcean]]];
}

-(NSArray*)WesternSouthAmerica
{
    return @[@[[self Columbia], [self Equador], [self Peru],[self Bolivia]],
             @[[self PacificOcean]]];
}

-(NSArray*)SouthernSouthAmerica
{
    return @[@[[self Chile], [self Argentina],[self Brazil], [self Uruguay], [self Paraguay]],
             @[[self AtlanticOcean], [self PacificOcean]]];
}

-(NSArray*)SouthernAfrica
{
    return @[@[[self SouthAfrica], [self Namibia], [self Botswana], [self Zimbabwe], [self Mozambique],[self Madagascar],[self Angola], [self Zambia], [self Malawi]],
             @[[self AtlanticOcean], [self PacificOcean]]];
}

-(NSArray*)SouthCentralAfrica
{
    return @[@[[self Angola], [self Zambia], [self Malawi],[self Mozambique],[self Tanzania],[self DemocraticRepublicOfCongo]],
             @[[self AtlanticOcean], [self PacificOcean]]];
}

-(NSArray*)CentralAfrica
{
    return @[@[[self Chad], [self Cameroon], [self EquiterialGuinea], [self Gabon],[self Congo], [self DemocraticRepublicOfCongo],[self SouthSudan], [self CentralAfricanRepublic]],
             @[[self AtlanticOcean]]];
}

-(NSArray*)EastAfrica
{
    return @[@[[self Sudan],[self Eritrea],[self Djibauti],[self Somalia], [self Ethiopia], [self Kenya],[self Rawanda],[self Burundi],[self Uganda],[self Tanzania]],
             @[[self IndianOcean]]];
}

-(NSArray*)NorthAfrica
{
    return @[@[[self Morocco],[self Algeria],[self Tunisia],[self Niger],[self Mali],[self Mauritania],[self Nigeria]],
             @[[self AtlanticOcean]]];
}

-(NSArray*)NileAfrica
{
    return @[@[[self Libya],[self Egypt],[self Sudan],[self Jordan],[self Israel],[self Tunisia]],
             @[[self AtlanticOcean]]];
}

-(NSArray*)WestAfrica
{
    return @[@[[self Senegal], [self TheGambia],[self GuineaBissau],[self Guinea],[self SierraLeone],[self Liberia], [self IvoryCoast],[self BurkinaFaso],[self Ghana],[self Togo],[self Benin]],
             @[[self AtlanticOcean]]];
}

-(NSArray*)WesternEurope
{
    return @[@[[self Ireland],[self UnitedKingdom],[self Netherlands], [self Belgium],[self Germany],[self France],[self Spain],[self Portugal],[self Italy],[self Switzerland],[self Austria]],@[[self AtlanticOcean]]];
}

-(NSArray*)EasternEurope
{
    return @[@[[self Poland],[self Belarus],[self Ukraine], [self CzechRepublic],[self Slovakia],[self Romania], [self Bulgaria],[self Moldova],[self Hungary]],
             @[[self AtlanticOcean],[self BlackSea]]];
}

-(NSArray*)Scandinavia
{
    return @[@[[self Denmark],[self Norway],[self Sweden], [self Finland], [self Estonia], [self Latvia],[self Lithuania]],
             @[[self AtlanticOcean]]];
}

-(NSArray*)Balkans
{
    return @[@[[self Slovenia],[self Croatia],[self Bosnia],[self Serbia], [self Albania],[self Macadonia],[self Greece]],
             @[[self AtlanticOcean]]];
}

-(NSArray*)MiddleEast
{
    return @[@[[self Turkey],[self Syria],[self Lebanon],[self Jordan],[self Israel],[self Cyprus],[self Georgia],[self Armenia],[self Azerbaijan]],
             @[[self AtlanticOcean]]];
}

-(NSArray*)CentralAsia
{
    return @[@[[self Kazakhstan],[self Uzbekistan],[self Tajikistan],[self Kyrgystan],[self Turkmenistan]],
             @[[self CaspianSea]]];
}

-(NSArray*)ArabianPeninsula
{
    return @[@[[self Yemen],[self Oman], [self UAE],[self Qatar],[self SaudiArabia],[self Iraq],[self Kuwait],[self Iran]],@[[self IndianOcean]]];
}

-(NSArray*)SouthAsia
{
    return @[@[[self Bangladesh],[self Bhutan],[self Nepal],[self India],[self SriLanka],[self Pakistan],[self Afganistan]],
             @[[self IndianOcean]]];
}

-(NSArray*)IndoChina
{
    return @[@[[self Myanmar],[self Malaysia],[self Thailand],[self Laos],[self Cambodia],[self Vietnam],[self Brunei]],
             @[[self IndianOcean],[self SouthChinaSea]]];
}

-(NSArray*)FarEast
{
    return @[@[[self NorthKorea],[self SouthKorea],[self Japan],[self Taiwan],[self Phillipines],[self China],[self Mongolia]],
             @[[self SeaOfJapan],[self SouthChinaSea],[self PacificOcean]]];
}

-(NSArray*)Australasia
{
    return @[@[[self PapuaNewGuinea],[self Australia],[self NewZealand]],
             @[[self IndianOcean],[self PacificOcean]]];
}

#pragma mark Oceans

-(ICOcean*)AtlanticOcean
{
    ICOcean *ocean = [[ICOcean alloc] init];
    ocean.name = @"Atlantic Ocean";
    return ocean;
}

-(ICOcean*)BlackSea
{
    ICOcean *ocean = [[ICOcean alloc] init];
    ocean.name = @"Black Sea";
    return ocean;
}

-(ICOcean*)CaspianSea
{
    ICOcean *ocean = [[ICOcean alloc] init];
    ocean.name = @"Caspian Sea";
    return ocean;
}

-(ICOcean*)IndianOcean
{
    ICOcean *ocean = [[ICOcean alloc] init];
    ocean.name = @"Indian Ocean";
    return ocean;
}

-(ICOcean*)PacificOcean
{
    ICOcean *ocean = [[ICOcean alloc] init];
    ocean.name = @"Pacific Ocean";
    return ocean;
}

-(ICOcean*)SeaOfJapan
{
    ICOcean *ocean = [[ICOcean alloc] init];
    ocean.name = @"Sea of Japan";
    return ocean;
}

-(ICOcean*)SouthChinaSea
{
    ICOcean *ocean = [[ICOcean alloc] init];
    ocean.name = @"South China Sea";
    return ocean;
}

#pragma mark Countries
-(ICCountry*)Afganistan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Afganistan";
    country.capital = @"Kabul";
    country.neighbors = @[@"China",@"Tajikistan",@"Uzbekistan",@"Turkmenistan",@"Iran",@"Pakistan"];
    return country;
}

-(ICCountry*)Albania
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Albania";
    country.capital = @"Tirana";
    country.neighbors = @[@"Serbia", @"Macadonia",@"Greece", @"Atlantic Ocean"];
    return country;
}

-(ICCountry*)Algeria
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Algeria";
    country.capital = @"Algiers";
    country.neighbors = @[@"Libya",@"Tunisia",@"Morocco",@"Mauritania",@"Mali",@"Niger", @"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Angola
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Angola";
    country.capital = @"Luanda";
    country.neighbors = @[@"Namibia",@"Zambia",@"Democratic Republic Of Congo",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Argentina
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Argentina";
    country.capital = @"Buenos Aires";
    country.neighbors = @[@"Chile",@"Bolivia",@"Paraguay",@"Brazil",@"Uruguay",@"Pacific Ocean", @"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Armenia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Armenia";
    country.capital = @"Yerevan";
    country.neighbors = @[@"Georgia",@"Azerbaijan",@"Iran",@"Turkey"];
    
    return country;
}

-(ICCountry*)Australia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Australia";
    country.capital = @"Canberra";
    country.neighbors = @[@"Indian Ocean",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Austria
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Austria";
    country.capital = @"Vienna";
    country.neighbors = @[@"Czech Republic",@"Germany",@"Switzerland",@"Italy",@"Slovenia",@"Hungary",@"Slovakia"];
    
    return country;
}

-(ICCountry*)Azerbaijan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Azerbaijan";
    country.capital = @"Baku";
    country.neighbors = @[@"Russia",@"Armenia",@"Azerbaijan",@"Iran",@"Caspian Sea"];
    
    return country;
}

-(ICCountry*)Bangladesh
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Bangladesh";
    country.capital = @"Dhaka";
    country.neighbors = @[@"India",@"Myanmar",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Belarus
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Belarus";
    country.capital = @"Minsk";
    country.neighbors = @[@"Russia",@"Latvia",@"Lithuania",@"Poland",@"Ukraine"];
    
    return country;
}

-(ICCountry*)Belgium
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Belgium";
    country.capital = @"Brussels";
    country.neighbors = @[@"Netherlands",@"Germany",@"France",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Belize
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Belize";
    country.capital = @"Blemopan";
    country.neighbors = @[@"Mexico",@"Guatemala",@"Pacific Ocean",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Benin
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Benin";
    country.capital = @"Porto Novo";
    country.neighbors = @[@"Niger",@"Niger",@"BurkinaFaso",@"Togo",@"Atlantic Ocean"];
   
    return country;
}

-(ICCountry*)Bhutan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Bhutan";
    country.capital = @"Thimpu";
    country.neighbors = @[@"India",@"China"];
    
    return country;
}

-(ICCountry*)Bolivia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Bolivia";
    country.capital = @"La Paz";
    country.neighbors = @[@"Brazil",@"Peru",@"Argentina",@"Chile"];
    
    return country;
}

-(ICCountry*)Bosnia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Bosnia";
    country.capital = @"Sarajevo";
    country.neighbors = @[@"Serbia",@"Croatia",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Botswana
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Botswana";
    country.capital = @"Gaborone";
    country.neighbors = @[@"Namibia",@"SouthAfrica",@"Zimbabwe",@"Zambia"];
    
    return country;
}

-(ICCountry*)Brazil
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Brazil";
    country.capital = @"Brazilia";
    country.neighbors = @[@"French Guyana",@"Surinam",@"Guyana",@"Venezuela",@"Columbia",@"Peru",@"Bolivia",@"Paraguay",@"Argentina",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Brunei
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Brunei";
    country.capital = @"Bandar Seri Bagawan";
    country.neighbors = @[@"Malaysia",@"South China Sea"];
    
    return country;
}

-(ICCountry*)Bulgaria
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Bulgaria";
    country.capital = @"Sofia";
    country.neighbors = @[@"Romania",@"Serbia",@"Macadonia",@"Greece",@"Turkey",@"Black Sea"];
    
    return country;
}

-(ICCountry*)BurkinaFaso
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Burkina Faso";
    country.capital = @"Ouagadougou";
    country.neighbors = @[@"Niger",@"Mali",@"Ivory Coast",@"Ghana",@"Togo",@"Benin"];
    
    return country;
}

-(ICCountry*)Burundi
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Burundi";
    country.capital = @"Bujumbura";
    country.neighbors = @[@"Rawanda",@"Democratic Republic Of Congo",@"Tanzania"];
    
    return country;
}

-(ICCountry*)Cambodia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Cambodia";
    country.capital = @"Phnom Penh";
    country.neighbors = @[@"Vietnam",@"Laos",@"Thailand",@"South China Sea"];
    
    return country;
}

-(ICCountry*)Cameroon
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Cameroon";
    country.capital = @"Yaounde";
    country.neighbors = @[@"Equiterial Guinea",@"Gabon",@"Congo",@"Central African Republic",@"Chad",@"Nigeria"];
    
    return country;
}

-(ICCountry*)Canada
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Canada";
    country.capital = @"Ottawa";
    country.neighbors = @[@"USA",@"Pacific Ocean",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)CentralAfricanRepublic
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Central African Republic";
    country.capital = @"Bangui";
    country.neighbors = @[@"South Sudan",@"Sudan",@"Chad",@"Cameroon",@"Congo",@"Democratic Republic Of Congo"];
    
    return country;
}

-(ICCountry*)Chad
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Chad";
    country.capital = @"N'Djamena";
    country.neighbors = @[@"Sudan",@"Libya",@"Niger",@"Nigeria",@"Cameroon",@"Central African Republic"];
    
    return country;
}

-(ICCountry*)Chile
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Chile";
    country.capital = @"Santiago";
    country.neighbors = @[@"Argentina",@"Peru",@"Bolivia",@"Brazil",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)China
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"China";
    country.capital = @"Beijing";
    country.neighbors = @[@"Russia",@"Mongolia",@"Kazakhstan",@"Kyrgystan",@"Tajikistan", @"Afganistan",@"Pakistan",@"India",@"Nepal",@"Bhutan",@"Myanmar",@"Laos",@"Vietnam",@"North Korea"];
   
    return country;
}

-(ICCountry*)Columbia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Columbia";
    country.capital = @"Bogota";
    country.neighbors = @[@"Panama",@"Venezuela",@"Brazil",@"Peru",@"Equador",@"Atlantic Ocean",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Congo
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Congo";
    country.capital = @"Brazzaville";
    country.neighbors = @[@"Central African Republic",@"Cameroon",@"Gabon",@"Democratic Republic Of Congo",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)CostaRica
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Costa Rica";
    country.capital = @"San Jose";
    country.neighbors = @[@"Nicaragua",@"Panama",@"Atlantic Ocean",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Croatia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Croatia";
    country.capital = @"Zagrab";
    country.neighbors = @[@"Hungary",@"Slovenia",@"Bosnia",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Cuba
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Cuba";
    country.capital = @"Havana";
    country.neighbors = @[@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Cyprus
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Cyprus";
    country.capital = @"Lefkosa";
    country.neighbors = @[@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)CzechRepublic
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Czech Republic";
    country.capital = @"Prague";
    country.neighbors = @[@"Poland",@"Germany",@"Austria",@"Slovakia"];
    
    return country;
}

-(ICCountry*)DemocraticRepublicOfCongo
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Democratic Republic of Congo";
    country.capital = @"Kinshasa";
    country.neighbors = @[@"South Sudan",@"Central African Republic",@"Congo",@"Angola",@"Zambia", @"Tanzania",@"Burundi",@"Rawanda",@"Uganda", @"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Denmark
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Denmark";
    country.capital = @"Copenhagen";
    country.neighbors = @[@"Germany",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Djibauti
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Djibauti";
    country.capital = @"Djibauti";
    country.neighbors = @[@"Somalia",@"Eritrea",@"Ethiopia",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)DominicanRepublic
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Dominican Republic";
    country.capital = @"Santo Domingo";
    country.neighbors = @[[self Haiti],[self AtlanticOcean]];
    
    return country;
}

-(ICCountry*)Egypt
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Egypt";
    country.capital = @"Cairo";
    country.neighbors = @[@"Sudan",@"Libya",@"Israel",@"Jordan",@"Saudi Arabia",@"Indian Ocean", @"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)ElSalvador
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"El Salvador";
    country.capital = @"San Salvador";
    country.neighbors = @[@"Guatemala",@"Honduras",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Equador
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Equador";
    country.capital = @"Quito";
    country.neighbors = @[@"Columbia",@"Peru",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)EquiterialGuinea
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Equiterial Guinea";
    country.capital = @"Malabo";
    country.neighbors = @[@"Cameroon",@"Gabon",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Eritrea
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Eritrea";
    country.capital = @"Asmara";
    country.neighbors = @[@"Djibauti",@"Sudan",@"Ethiopia",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Estonia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Estonia";
    country.capital = @"Talinn";
    country.neighbors = @[@"Russia",@"Latvia",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Ethiopia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Ethiopia";
    country.capital = @"Adis Ababa";
    country.neighbors = @[@"Somalia",@"Djibauti",@"Eritrea",@"Sudan",@"South Sudan",@"Kenya"];
    
    return country;
}

-(ICCountry*)Finland
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Finland";
    country.capital = @"Heksinki";
    country.neighbors = @[@"Russia",@"Norway",@"Sweden",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)France
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"France";
    country.capital = @"Paris";
    country.neighbors = @[@"Germany",@"Belgium",@"Spain",@"Italy",@"Switzerland",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)FrenchGuyana
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"French Guyana";
    country.capital = @"Cayenne";
    country.neighbors = @[@"Surinam",@"Brazil",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Gabon
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Gabon";
    country.capital = @"Libraville";
    country.neighbors = @[@"Cameroon",@"Congo",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Georgia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Georgia";
    country.capital = @"Tblisi";
    country.neighbors = @[@"Russia",@"Azerbaijan",@"Turkey",@"Armenia",@"Black Sea"];
    
    return country;
}

-(ICCountry*)Germany
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Germany";
    country.capital = @"Berlin";
    country.neighbors = @[@"Poland",@"Denmark",@"Netherlands",@"Belgium", @"France",@"Switzerland",@"Austria",@"Czech Republic",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Ghana
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Ghana";
    country.capital = @"Accra";
    country.neighbors = @[@"Togo",@"Burkina Faso",@"Ivory Coast",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Greece
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Greece";
    country.capital = @"Athens";
    country.neighbors = @[@"Turkey",@"Bulgaria",@"Macadonia",@"Albania",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Guatemala
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Guatemala";
    country.capital = @"Guatemala";
    country.neighbors = @[@"Mexico",@"Belize",@"Honduras",@"El Salvador",@"Pacific Ocean",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)GuineaBissau
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Guinea Bissau";
    country.capital = @"Bissau";
    country.neighbors = @[@"Senegal",@"Guinea",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Guinea
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Guinea";
    country.capital = @"Conakry";
    country.neighbors = @[@"Liberia",@"Ivory Coast",@"Mali",@"Senegal",@"Guinea Bissau",@"Sierra Leone",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Guyana
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Guyana";
    country.capital = @"Georgetown";
    country.neighbors = @[@"Venezuela",@"Surinam",@"Brazil",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Haiti
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Haiti";
    country.capital = @"Part Au Prince";
    country.neighbors = @[@"Dominican Republic",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Honduras
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Honduras";
    country.capital = @"Tegucigalpa";
    country.neighbors = @[@"Guatemala",@"El Salvador",@"Nicaragua",@"Atlantic Ocean",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Hungary
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Hungary";
    country.capital = @"Budapest";
    country.neighbors = @[@"Ukraine",@"Slovakia",@"Austria",@"Slovenia",@"Croatia",@"Serbia", @"Romania"];
    
    return country;
}

-(ICCountry*)Iceland
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Iceland";
    country.capital = @"ReykjaviK";
    country.neighbors = @[@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)India
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"India";
    country.capital = @"Delhi";
    country.neighbors = @[@"Pakistan",@"China",@"Nepal",@"Bhutan",@"Myanmar",@"Bangladesh",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Indonesia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Indonesia";
    country.capital = @"Jakarta";
    country.neighbors = @[@"Papua New Guines",@"Malaysia",@"Indian Ocean",@"South China Sea"];
    
    return country;
}

-(ICCountry*)Iran
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Iran";
    country.capital = @"Tehran";
    country.neighbors = @[@"Pakistan", @"Afganistan",@"Turkmenistan",@"Azerbaijan",@"Armenia", @"Turkey",@"Iraq",@"Caspian Sea",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Iraq
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Iraq";
    country.capital = @"Bagdad";
    country.neighbors = @[@"Iran",@"Turkey",@"Syria",@"Jordan",@"Saudi Arabia",@"Kuwait",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Ireland
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Ireland";
    country.capital = @"Dublin";
    country.neighbors = @[@"United Kingdom",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Israel
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Israel";
    country.capital = @"Tel Aviv";
    country.neighbors = @[@"Lebanon",@"Syria",@"Jordan",@"Egypt",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Italy
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Italy";
    country.capital = @"Rome";
    country.neighbors = @[@"Slovenia",@"Austria",@"Switzerland",@"France",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)IvoryCoast
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Ivory Coast";
    country.capital = @"Abidjan";
    country.neighbors = @[@"Ghana",@"Burkina Faso",@"Mali",@"Guinea",@"Libya",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Jamaica
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Jamaica";
    country.capital = @"Kingston";
    country.neighbors = @[@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Japan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Japan";
    country.capital = @"Tokyo";
    country.neighbors = @[@"Sea Of Japan",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Jordan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Jordan";
    country.capital = @"Amman";
    country.neighbors = @[@"Iraq",@"Syria",@"Israel",@"Saudi Arabia",@"Egypt"];
    
    return country;
}

-(ICCountry*)Kazakhstan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Kazakhstan";
    country.capital = @"Astana";
    country.neighbors = @[@"Russia",@"Chile",@"Kyrgystan",@"Uzbekistan",@"Caspian Sea"];
    
    return country;
}

-(ICCountry*)Kenya
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Kenya";
    country.capital = @"Nairobi";
    country.neighbors = @[@"Somalia",@"Ethiopia",@"South Sudan",@"Uganda",@"Tanzania",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Kuwait
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Kuwait";
    country.capital = @"Kuwait City";
    country.neighbors = @[@"Iraq",@"Saudi Arabia",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Kyrgystan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Kyrgystan";
    country.capital = @"Bishkek";
    country.neighbors = @[@"Kazakhstan",@"Chile",@"Tajikistan",@"Uzbekistan"];
    
    return country;
}

-(ICCountry*)Laos
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Laos";
    country.capital = @"Vientiane";
    country.neighbors = @[@"Vietnam",@"China",@"Myanmar",@"Thailand",@"Cambodia"];
    
    return country;
}

-(ICCountry*)Latvia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Latvia";
    country.capital = @"Riga";
    country.neighbors = @[@"Estonia",@"Russia",@"Lithuania",@"Belarus",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Lebanon
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Lebanon";
    country.capital = @"Beirut";
    country.neighbors = @[@"Syria",@"Israel",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Liberia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Liberia";
    country.capital = @"Monrovia";
    country.neighbors = @[@"Ivory Coast",@"Guinea",@"Sierra Leone",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Libya
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Libya";
    country.capital = @"Tripoli";
    country.neighbors = @[@"Egypt",@"Sudan",@"Chad",@"Niger",@"Algeria",@"Tunisia",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Lithuania
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Lithuania";
    country.capital = @"Vilnius";
    country.neighbors = @[@"Latvia",@"Belarus",@"Poland",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Macadonia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Macedonia";
    country.capital = @"Skopje";
    country.neighbors = @[@"Serbia",@"Albania",@"Greece",@"Bulgaria"];
    
    return country;
}

-(ICCountry*)Madagascar
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Madagascar";
    country.capital = @"Antanarivo";
    country.neighbors = @[@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Malawi
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Malawi";
    country.capital = @"Lilongwe";
    country.neighbors = @[@"Zambia",@"Mozambique",@"Tanzania"];
    
    return country;
}

-(ICCountry*)Malaysia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Malaysia";
    country.capital = @"Kuala Lumpur";
    country.neighbors = @[@"Thailand",@"Indonesia",@"Brunei",@"Indian Ocean",@"South China Sea"];
    
    return country;
}

-(ICCountry*)Mali
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Mali";
    country.capital = @"Bamako";
    country.neighbors = @[@"Niger",@"Algeria", @"Mauritania" ,@"Senegal",@"Guinea",@"Ivory Coast",@"Burkina Faso"];
    
    return country;
}

-(ICCountry*)Mauritania
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Mauritania";
    country.capital = @"Nouakchott";
    country.neighbors = @[@"Mali",@"Algeria",@"Morocco",@"Senegal"];
    
    return country;
}

-(ICCountry*)Mexico
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Mexico";
    country.capital = @"Mexico City";
    country.neighbors = @[@"USA",@"Guatemala",@"Belize",@"Atlantic Ocean",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Moldova
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Moldova";
    country.capital = @"Chisinau";
    country.neighbors = @[@"Ukraine",@"Romania"];
    
    return country;
}

-(ICCountry*)Mongolia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Mongolia";
    country.capital = @"Ulan Bator";
    country.neighbors = @[@"Russia",@"China"];
    
    return country;
}

-(ICCountry*)Morocco
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Morocco";
    country.capital = @"Rabat";
    country.neighbors = @[@"Algeria",@"Mauritania",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Mozambique
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Mozambique";
    country.capital = @"Maputo";
    country.neighbors = @[@"South Africa",@"Zimbabwe",@"Zambia",@"Malawi",@"Tanzania",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Myanmar
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Myanmar";
    country.capital = @"Yangoon";
    country.neighbors = @[@"China",@"India",@"Bangladesh",@"Thailand",@"Laos",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Namibia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Namibia";
    country.capital = @"Windhoek";
    country.neighbors = @[@"South Africa",@"Botswana",@"Zambia", @"Angola",@"Zimbabwe",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Nepal
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Nepal";
    country.capital = @"Kathmandu";
    country.neighbors = @[@"India",@"China"];
    
    return country;
}

-(ICCountry*)Netherlands
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Netherlands";
    country.capital = @"Amsterdam";
    country.neighbors = @[@"Germany",@"Belgium",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)NewZealand
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"New Zealand";
    country.capital = @"Wllington";
    country.neighbors = @[@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Nicaragua
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Nicaragua";
    country.capital = @"Managua";
    country.neighbors = @[@"Honduras",@"Costa Rica",@"Pacific Ocean",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Niger
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Niger";
    country.capital = @"Niamey";
    country.neighbors = @[@"Chad",@"Libya",@"Algeria",@"Mali",@"Nigeria",@"Benin",@"Burkina Faso"];
    
    return country;
}

-(ICCountry*)Nigeria
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Nigeria";
    country.capital = @"Abuja";
    country.neighbors = @[@"Cameroon",@"Chad",@"Niger",@"Benin",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)NorthKorea
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"North Korea";
    country.capital = @"Pyongyang";
    country.neighbors = @[@"South Korea",@"China",@"Russia"];
    
    return country;
}

-(ICCountry*)Norway
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Norway";
    country.capital = @"Oslo";
    country.neighbors = @[@"Russia",@"Finland",@"Sweden",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Oman
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Oman";
    country.capital = @"Muscat";
    country.neighbors = @[@"Yemen",@"Saudi Arabia",@"UAE",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Pakistan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Pakistan";
    country.capital = @"Islamabad";
    country.neighbors = @[@"China",@"Afganistan",@"Iran",@"India",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Panama
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Panama";
    country.capital = @"Panama";
    country.neighbors = @[ @"Costa Rica",@"Columbia", @"Atlantic Ocean",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)PapuaNewGuinea
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Papua New Guines";
    country.capital = @"Port Moresby";
    country.neighbors = @[@"Indonesia",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Paraguay
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Paraguay";
    country.capital = @"Asuncion";
    country.neighbors = @[@"Bolivia",@"Argentina",@"Brazil"];
    
    return country;
}

-(ICCountry*)Peru
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Peru";
    country.capital = @"Lima";
    country.neighbors = @[@"Equador",@"Columbia",@"Brazil",@"Bolivia",@"Chile",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Phillipines
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Phillipines";
    country.capital = @"Manila";
    country.neighbors = @[@"South China Sea",@"Sea Of Japan",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Poland
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Poland";
    country.capital = @"Warsaw";
    country.neighbors = @[@"Lithuania",@"Belarus",@"Ukraine",@"Slovakia",@"Czech Republic",@"Germany",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Portugal
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Potugal";
    country.capital = @"Lisbon";
    country.neighbors = @[@"Spain",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Qatar
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Qatar";
    country.capital = @"Doha";
    country.neighbors = @[@"Saudi Arabia",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Rawanda
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Rawanda";
    country.capital = @"Kigali";
    country.neighbors = @[@"Democratic Republic Of Congo",@"Burundi",@"Tanzania",@"Uganda"];
    
    return country;
}

-(ICCountry*)Romania
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Romania";
    country.capital = @"Bhucharest";
    country.neighbors = @[@"Ukraine",@"Moldova",@"Hungary",@"Serbia",@"Bulgaria",@"Black Sea"];
    
    return country;
}

-(ICCountry*)Russia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Russia";
    country.capital = @"Moscow";
    country.neighbors = @[@"North Korea",@"China",@"Mongolia",@"Kazakhstan",@"Azerbaijan",@"Georgia",@"Ukraine",@"Belarus",@"Latvia",@"Estonia",@"Finland",@"Norway"];
    
    return country;
}

-(ICCountry*)SaudiArabia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Saudi Arabia";
    country.capital = @"Riyad";
    country.neighbors = @[@"Kuwait",@"Iraq",@"Jordan",@"Egypt",@"Yemen", @"Oman",@"UAE",@"Qatar",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Senegal
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Senegal";
    country.capital = @"Dakar";
    country.neighbors = @[@"Mauritania",@"Mali",@"Guinea",@"Guinea Bissau",@"The Gambia",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Serbia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Serbia";
    country.capital = @"Belgrade";
    country.neighbors = @[@"Romania",@"Hungary",@"Croatia",@"Bosnia",@"Albania",@"Macadonia",@"Bulgaria",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)SierraLeone
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Sierra Leone";
    country.capital = @"Freetown";
    country.neighbors = @[@"Guinea",@"Liberia",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Slovakia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Slovakia";
    country.capital = @"Bratislava";
    country.neighbors = @[@"Poland",@"Czech Republic",@"Austria",@"Hungary",@"Ukraine"];
    
    return country;
}

-(ICCountry*)Slovenia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Slovenia";
    country.capital = @"Ljubljana";
    country.neighbors = @[@"Austria", @"Croatia",@"Italy", @"Hungary",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Somalia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Somalia";
    country.capital = @"Mogadishu";
    country.neighbors = @[ @"Djibauti",@"Ethiopia",@"Kenya",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)SouthAfrica
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"South Africa";
    country.capital = @"Pretoria";
    country.neighbors = @[@"Namibia",@"Botswana",@"Zimbabwe",@"Mozambique",@"Indian Ocean",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)SouthKorea
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"South Korea";
    country.capital = @"Seoul";
    country.neighbors = @[@"North Korea",@"Sea Of Japan"];
    
    return country;
}

-(ICCountry*)SouthSudan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"South Sudan";
    country.capital = @"Juba";
    country.neighbors = @[@"Ethiopia",@"Sudan",@"Central African Republic",@"Democratic Republic Of Congo",@"Uganda",@"Kenya"];
    
    return country;
}

-(ICCountry*)Spain
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Spain";
    country.capital = @"Madrid";
    country.neighbors = @[@"France",@"Portugal",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)SriLanka
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Sri Lanka";
    country.capital = @"Colombo";
    country.neighbors = @[@"India",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Sudan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Sudan";
    country.capital = @"Khartoum";
    country.neighbors = @[@"Eritrea",@"Ethiopia",@"South Sudan",@"Central African Republic",@"Chad",@"Libya",@"Egypt",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Surinam
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Surinam";
    country.capital = @"Paramaribo";
    country.neighbors = @[@"Guyana",@"French Guyana",@"Brazil",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Sweden
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Sweden";
    country.capital = @"Stockholm";
    country.neighbors = @[@"Norway",@"Finland",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Switzerland
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Switzerland";
    country.capital = @"Bern";
    country.neighbors = @[@"Austria",@"Germany",@"France",@"Italy"];
    
    return country;
}

-(ICCountry*)Syria
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Syria";
    country.capital = @"Damascus";
    country.neighbors = @[@"Iraq",@"Turkey",@"Lebanon",@"Israel",@"Jordan",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Taiwan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Taiwan";
    country.capital = @"Taipei";
    country.neighbors = @[@"South China Sea",@"Sea Of Japan"];
    
    return country;
}

-(ICCountry*)Tajikistan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Tajikistan";
    country.capital = @"Dushanbe";
    country.neighbors = @[@"China",@"Afganistan",@"Kyrgystan",@"Uzbekistan"];
    
    return country;
}

-(ICCountry*)Tanzania
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Tanzania";
    country.capital = @"Dadana";
    country.neighbors = @[@"Democratic Republic Of Congo", @"Zambia",@"Malawi",@"Mozambique",@"Kenya",@"Uganda",@"Rawanda",@"Burundi",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Thailand
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Thailand";
    country.capital = @"Bankok";
    country.neighbors = @[@"Myanmar",@"Laos",@"Cambodia",@"Malaysia",@"South China Sea"];
    
    return country;
}

-(ICCountry*)TheGambia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"The Gambia";
    country.capital = @"Banjul";
    country.neighbors = @[@"Senegal",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Togo
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Togo";
    country.capital = @"Lome";
    country.neighbors = @[@"Benin",@"Burkina Faso",@"Ghana",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Tunisia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Tunisia";
    country.capital = @"Tunis";
    country.neighbors = @[@"Algeria",@"Libya",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Turkey
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Turkey";
    country.capital = @"Ankara";
    country.neighbors = @[@"Bulgaria",@"Greece",@"Syria",@"Iraq",@"Iran",@"Armenia", @"Georgia",@"Black Sea",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Turkmenistan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Turkmenistan";
    country.capital = @"Ashqabat";
    country.neighbors = @[@"Kazakhstan",@"Uzbekistan",@"Afganistan",@"Iran",@"Caspian Sea"];
    
    return country;
}

-(ICCountry*)UAE
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"UAE";
    country.capital = @"Dubai";
    country.neighbors = @[@"Saudi Arabia",@"Oman",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Uganda
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Uganda";
    country.capital = @"Kampala";
    country.neighbors = @[@"South Sudan",@"Democratic Republic Of Congo",@"Rawanda",@"Tanzania",@"Kenya"];
    
    return country;
}

-(ICCountry*)Ukraine
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Ukraine";
    country.capital = @"Kiev";
    country.neighbors = @[@"Russia",@"Belarus", @"Poland", @"Slovakia", @"Hungary",@"Romania", @"Moldova",@"Black Sea"];
    
    return country;
}

-(ICCountry*)UnitedKingdom
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"United Kingdom";
    country.capital = @"London";
    country.neighbors = @[@"Ireland",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Uruguay
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Uruguay";
    country.capital = @"Montevideo";
    country.neighbors = @[@"Argentina",@"Brazil",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)USA
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"USA";
    country.capital = @"Washigton DC";
    country.neighbors = @[@"Canada",@"Mexico",@"Atlantic Ocean",@"Pacific Ocean"];
    
    return country;
}

-(ICCountry*)Uzbekistan
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Uzbekistan";
    country.capital = @"Tashkent";
    country.neighbors = @[@"Kazakhstan",@"Kyrgystan",@"Tajikistan",@"Afganistan",@"Turkmenistan"];
    
    return country;
}

-(ICCountry*)Venezuela
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Venezuela";
    country.capital = @"Caracas";
    country.neighbors = @[@"Columbia",@"Brazil",@"Guyana",@"Atlantic Ocean"];
    
    return country;
}

-(ICCountry*)Vietnam
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Vietnam";
    country.capital = @"Hanoi";
    country.neighbors = @[@"China",@"Laos",@"Cambodia",@"South China Sea"];
    
    return country;
}

-(ICCountry*)Yemen
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Yemen";
    country.capital = @"Sana'a";
    country.neighbors = @[@"Saudi Arabia",@"Oman",@"Indian Ocean"];
    
    return country;
}

-(ICCountry*)Zambia
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Zambia";
    country.capital = @"Lusaka";
    country.neighbors = @[@"Democratic Republic Of Congo",@"Angola", @"Namibia", @"Botswana", @"Zimbabwe",@"Mozambique",@"Malawi",@"Tanzania"];
    
    return country;
}

-(ICCountry*)Zimbabwe
{
    ICCountry *country = [[ICCountry alloc] init];
    country.name = @"Zimbabwe";
    country.capital = @"Harare";
    country.neighbors = @[ @"Botswana", @"South Africa",@"Mozambique",@"Zambia",@"Namibia"];
    
    return country;
}

@end
