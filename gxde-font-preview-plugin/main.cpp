#include "dde-file-manager/dfmfilepreviewplugin.h"

#include "fontpreview.h"

DFM_BEGIN_NAMESPACE

class TextPreviewPlugin : public DFMFilePreviewPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID DFMFilePreviewFactoryInterface_iid FILE "gxde-font-preview-plugin.json")

public:
    DFMFilePreview *create(const QString &key) Q_DECL_OVERRIDE
    {
        Q_UNUSED(key)

        return new FontPreview();
    }
};

DFM_END_NAMESPACE

#include "main.moc"
