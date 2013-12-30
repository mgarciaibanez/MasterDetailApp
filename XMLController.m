//
//  XMLController.m
//  MasterDetailApp
//
//  Created by mgarciaibanez on 30/12/13.
//  Copyright (c) 2013 mgarciaibanez. All rights reserved.
//

#import "XMLController.h"
#import "TBXML.h"
#import "GDataXMLNode.h"
#import "File.h"
#import "DisplayUnit.h"

@implementation XMLController

@synthesize file = _file;
@synthesize displayUnit = _displayUnit;


/* Sample File
 <?xml version="1.0"?>
 <article xmlns:aid="http://ns.adobe.com/AdobeInDesign/4.0/" version="2">
 <meta>
 <newsletter shortid="AC" longid="ESACACAR_EU030105">
 <nl>ESACACAL</nl>
 <volume>03</volume>
 <number>01</number>
 <page>05</page>
 <subpage>01</subpage>
 <date day="12" month="05" year="2003"/>
 </newsletter>
 </meta>
 <content>
 <keyword>ADMINISTRADORES</keyword>
 <title>¿Cómo me retribuyo?</title>
 <intro><p>Uste...</p></intro>
 <body> <p>Usted ha ...</p>
 <subtitle>Retribuido</subtitle> <p>El cargo de administrador (o de miembro del consejo de administración) puede ser gratuito o retribuido. <b>Apunte.</b> Si los estatutos no dicen nada se considera que el ejercicio del cargo es gratuito. Por ello, si quiere que el cargo sea remunerado, deberá modificarlos, indicando además cómo se fijará cada año la retribución.</p> <p><b>Concreto.</b> ...</p>
 <subtitle>Modificación</subtitle> <p>Para mod... </p>
 </body>
 <conclusion>
 <p>Si quiere cobrar...</p>
 </conclusion>
 </content>
 </article>

 */
#pragma - mark
#pragma - mark Parsing files
- (void) parseFile{
    //Load the xml file
    TBXML *tbxmlFile = [TBXML tbxmlWithXMLFile:@"ApuntesyConsejos1" fileExtension:@"xml" error:nil];
    TBXMLElement *xmlArticle = tbxmlFile.rootXMLElement;
    TBXMLElement *metaChild = [TBXML childElementNamed:@"meta" parentElement:xmlArticle];
    TBXMLElement *contentChild =[TBXML childElementNamed:@"content" parentElement:xmlArticle];
    TBXMLElement *newsletterChild = [TBXML childElementNamed:@"newsletter" parentElement:metaChild];
    if (newsletterChild){
        NSString *shortId = [TBXML valueOfAttributeNamed:@"shortid" forElement:newsletterChild];
        NSString *longId = [TBXML valueOfAttributeNamed:@"longid" forElement:newsletterChild];
        NSString *nlString = [TBXML textForElement:[TBXML childElementNamed:@"nl" parentElement:newsletterChild]];
        NSString *volumeString = [TBXML textForElement:[TBXML childElementNamed:@"volume" parentElement:newsletterChild]];
        NSString *numberString = [TBXML textForElement:[TBXML childElementNamed:@"number" parentElement:newsletterChild]];
        NSString *pageString = [TBXML textForElement:[TBXML childElementNamed:@"page" parentElement:newsletterChild]];
        NSString *subPageString = [TBXML textForElement:[TBXML childElementNamed:@"subpage" parentElement:newsletterChild]];
        TBXMLElement *elementDate = [TBXML childElementNamed:@"date" parentElement:newsletterChild];
        NSString *dateString = [NSString stringWithFormat:@"%@%@%@",[TBXML valueOfAttributeNamed:@"day" forElement:elementDate],[TBXML valueOfAttributeNamed:@"month" forElement:elementDate],[TBXML valueOfAttributeNamed:@"year" forElement:elementDate]];
        //Create object and instance it
        File *file2Set = [[File alloc]init];
        _file = file2Set;
        if (shortId) _file.codFileShort = shortId;
        if (longId) _file.codFile = longId;
        if (nlString) _file.filenl = nlString;
        if (volumeString) _file.fileVolume = volumeString;
        if (numberString) _file.fileNumber = numberString;
        if (pageString) _file.filePage = pageString;
        if (subPageString) _file.fileSubPage = subPageString;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"ddMMyyyy"];
        if (dateString) _file.fileVersionDate = [dateFormat dateFromString:dateString];
    }
    
    if (contentChild){
        NSString *keywordString = [TBXML textForElement:[TBXML childElementNamed:@"keyword" parentElement:contentChild]];
        NSString *titleString = [TBXML textForElement:[TBXML childElementNamed:@"title" parentElement:contentChild]];
        NSString *path2Document = [[NSBundle mainBundle] pathForResource:@"ApuntesyConsejos1" ofType:@"xml"];
        NSString *introString = [self formattedTextFromXMLPathAndDocument:@"/article/content/intro/p" documentPath:path2Document];
        NSString *bodyString = [self formattedTextFromXMLPathAndDocument:@"/article/content/body/p" documentPath:path2Document];
        NSString *conclusionString = [self formattedTextFromXMLPathAndDocument:@"/article/content/conclusion/p" documentPath:path2Document];
        
        DisplayUnit *displayUnit2Set = [[DisplayUnit alloc] init];
        _displayUnit = displayUnit2Set;
        if (_file) _displayUnit.parentFile = _file;
        if (keywordString) _displayUnit.mainTitleDU = keywordString;
        if (titleString) _displayUnit.titleDU = titleString;
        if (introString) _displayUnit.introDU = introString;
        if (bodyString) _displayUnit.bodyDU = bodyString;
        if (conclusionString) _displayUnit.conclusionDU = conclusionString;
    }
}

#pragma - mark
#pragma - mark General XML Functions
//Function to return HTML formatted text from a document and xPath sent as parameters
-(NSString *)formattedTextFromXMLPathAndDocument:(NSString *)xpath documentPath:(NSString *)documentPath{
    NSString *result;
    //Load document to get html string
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:[[NSMutableData alloc] initWithContentsOfFile:documentPath] error:&error];
    
    result = [(GDataXMLNode *)[self nodeForXpath:xpath inDocument:doc] XMLString];
    return result;
}

//Function to return a GDATAXMLNode from xPath
-(GDataXMLNode *)nodeForXpath:(NSString *)xpath inDocument:(GDataXMLDocument *)document{
    NSArray *nodes=[document nodesForXPath:xpath error:nil];
    if (nodes && ([nodes count]>0)) {
        return [nodes objectAtIndex:0];
    }else{
        return nil;
    }
}

/*
 ************* TBXML SAMPLES
 - (void)loadUnknownXML {
 // Load and parse the books.xml file
 tbxml = [[TBXML tbxmlWithXMLFile:@"books.xml"] retain];
 
 // If TBXML found a root node, process element and iterate all children
 if (tbxml.rootXMLElement)
 [self traverseElement:tbxml.rootXMLElement];
 
 // release resources
 [tbxml release];
 }
 
 - (void) traverseElement:(TBXMLElement *)element {
 
 do {
 // Display the name of the element
 NSLog(@"%@",[TBXML elementName:element]);
 
 // Obtain first attribute from element
 TBXMLAttribute * attribute = element->firstAttribute;
 
 // if attribute is valid
 while (attribute) {
 // Display name and value of attribute to the log window
 NSLog(@"%@->%@ = %@",
 [TBXML elementName:element],
 [TBXML attributeName:attribute],
 [TBXML attributeValue:attribute]);
 
 // Obtain the next attribute
 attribute = attribute->next;
 }
 
 // if the element has child elements, process them
 if (element->firstChild)
 [self traverseElement:element->firstChild];
 
 // Obtain next sibling element
 } while ((element = element->nextSibling));
 }
 */

@end
