%module "Audiere"

%{
#include <audiere.h>
%}

%include "audiere.h"

%template(FilePtr)            audiere::RefPtr<audiere::File>;
%template(SampleSourcePtr)    audiere::RefPtr<audiere::SampleSource>;
%template(LoopPointSourcePtr) audiere::RefPtr<audiere::LoopPointSource>;
%template(OutputStreamPtr)    audiere::RefPtr<audiere::OutputStream>;
%template(EventPtr)           audiere::RefPtr<audiere::Event>;
%template(StopEventPtr)       audiere::RefPtr<audiere::StopEvent>;
%template(CallbackPtr)        audiere::RefPtr<audiere::Callback>;
%template(StopCallbackPtr)    audiere::RefPtr<audiere::StopCallback>;
%template(AudioDevicePtr)     audiere::RefPtr<audiere::AudioDevice>;
%template(SampleBufferPtr)    audiere::RefPtr<audiere::SampleBuffer>;
%template(SoundEffectPtr)     audiere::RefPtr<audiere::SoundEffect>;
%template(CDDevicePtr)        audiere::RefPtr<audiere::CDDevice>;
%template(MIDIStreamPtr)      audiere::RefPtr<audiere::MIDIStream>;
%template(MIDIDevicePtr)      audiere::RefPtr<audiere::MIDIDevice>;

%{
%}
