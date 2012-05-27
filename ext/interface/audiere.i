%module "Audiere"

%{
#include <audiere.h>
%}

%include "audiere.h"

%template(AudioDevicePtr) audiere::RefPtr<audiere::AudioDevice>;
%template(OutputStreamPtr) audiere::RefPtr<audiere::OutputStream>;

%{
%}
