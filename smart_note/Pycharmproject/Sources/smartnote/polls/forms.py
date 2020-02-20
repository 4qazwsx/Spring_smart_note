from django import forms

from .models import UploadFileModel

class UploadFileForm(forms.Form):
    title = forms.CharField(max_length=50)
    file = forms.FileField()
    print("---------forms-------")

class DocumentForm(forms.Form):
    docfile = forms.FileField(
        label='Select a file',
        help_text='max. 42 megabytes'
    )
    #class Meta:
        #model = UploadFileModel
        #fields = ('title', 'file')
        #print("---------forms-------")

    #def __init__(self, *args, **kwargs):
        #super(UploadFileForm, self).__init__(*args, **kwargs)
        #self.fields['file'].required = False