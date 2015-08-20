//
//  native_lib.h
//  DynamsoftBarcodeReader
//
//  Created by Ling Xiao on 15/8/20.
//

#ifndef __DynamsoftBarcodeReader__native_lib__
#define __DynamsoftBarcodeReader__native_lib__

#include <stdio.h>

#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

#include "If_DBR.h"

pBarcodeResultArray dbr_decodeBarcodeFile(char* fileName);
int dbr_release_memory(pBarcodeResultArray paryResult);
const char * GetFormatStr(__int64 format);

#endif /* defined(__DynamsoftBarcodeReader__native_lib__) */
