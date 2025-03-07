CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            h/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_75/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-030          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190901T142447        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
8513978368         /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1733500        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             20         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_py            �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_xml           �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.75</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              >�Zm�b?)/�,�?N8��'?fb��.�?x�h�B�w?���λ�W?�O=�a8(?�0P���y?���D�6?�C�y�4j?�;�\5؃?�I�1�?����C�?���A�?����ګ?�y���7d?ǜ���%3?��x�Ǝ�?ΏVף?�/n��J�?�41_��b?�V����?וdv =?��'?�`?�l�`��6?��^��#?��{_,�D?�G�e��?����`T9?�I����U?��d�?�J��'?�@���G?�2���k?����|?��+�a*3?���A�GH?��{���?���=ӡ�?���,v?�'��?�O�¾�?�Hu��U?��:��T�?����v��?�D��G��?���Ok�?��kehJ�?�Y�OѨ�@ c���Q�@�D] �@߫F�u�@�M�!�@mQ�g�@;I���@�!x��@��L�E�@��p�c@�R?�o@��r��a@	q�,ٵ@
`K[M�@Tl+�        >j��1S�>�}�|�>��Z��D�>�ν�"Y?�|���?9h�k�7?&v���?2,6��,�?;i�b[�2?C��X�� ?J�]�Tk?Q�����?WN_�	�.?]�o��?b��t�m�?f��Y�K?k�bvD�?pڦ���?t+j�4Z?w�d�b�?|>��$�?��=��?�I��F�N?�];G�}�?��K�?����r�?��\�,?�Y/�(k?���w:��?���z(aM?��q
Dw?��'��fc?����B�E?������O?�4��PV?����A�?���@�?���Zj$q?���i\%?���)6?������4?���a&�?�׸*�e�?�<�}Qf?��6Bܐ?�H@zP�?�»NK,�?�W֥��B?��Q��?��V�4?�ċ�&�?�� N�R_?�6�ճ?�S�33\t?�傖׉�?�4_����?ӗ<��A?�腲�?֜2�ȟ_?�?��a�?���|�ǅ?��wc~�?ݺ�3�        >�'�R��?%�QR��?Jk�&M �?c�t���?v��$�?�U<He�?���9��?���]t?�4�7��?��_��F�?�}�ǀ�?�m��c�?���`�w�?��`�8V?��hi?��Jf?ŀ�����?ț%�LP?��l�3>?πS���?Ѧ��W?ӭl���|?���F��?��<�-?څsw�hz?��mJ�?���˔.�?�K���?����؈?�Xl��OF?���6���?絊,B�p?郃Y�b?�gH�?�a����w?�rع�6t?���ѯ+?��Nz?�b��?�VMQ��)?��ƈQ7?����Ų�?�U�X˅?��=7AZ?�F�.o ?�ի��'V?�s�m���@ ���@ �2KN~@��w���@����M�@�-j�O@�4l.I@�*���@��4�x-@��v� @	>���@
D';���@{�MV�@�m��?@	=�;�n@_~���m@`:�{ß        ?b<z�o�?�M�]mt?�Ƙ��X ?��_5m?���j�x�?�� QI4b@��W�B@���M;@�b�׌
@�;�Ùy@"p(Ț�L@'�s�e;@,��3��@0�$I��N@3�G_�@7 9��@:��Z�F|@>eýWQ^@A38�aA@CR��Iy{@E�D�� @G�/RA�@Joܦb�(@Mq3�\J@O�+(3{@QU��Y�q@Rզ��t1@Te����u@V�/�@W�vD�@Yx��5r�@[KE��&a@].�����@_$����@`�w��� @a���s�@b�Q!S=H@c�����b@d��:�^@f/,S�`@gi�3�B�@h��Ȍ�@i�}��N@kR�W��@l�+AG��@nY���x@o�"K�[�@p�Fz�@qJ�uc@r,d�%�@r�a�Z��@s�pb�q�@t�[ʛ�@ue)�=�@vE�nPk�@w+��?��@x/T�2@yߤ�V-@y��=�O@z�S��@{�Q���@|����e�@~e!S��        >�g��?��D�?=�mZ1y�?V1zS��?h$s���?u�9�r?���Q�9�?�2�5e��?�?p��?��.��G�?��cG�u?��t̺?�ZrY�2�?�M�[���?�d�<�nb?����s��?�����?�@'�A?����m7?��Ӯ�.?��BAZ�?�8V���?��z���N?��m�G�l?�T���N�?�œG<j?�U��i٩?�,�%��?�ߋEH��?�ݎ����?���pi?�OH�5?�����	?�,$N��?҉��<X?����iw	?�u>�o&?��߼�e?أ&�2�?�RP��??��r�?��R�ˈ?��}��%?����
i?���5��%?���K>�S?���KӸX?�i ���?�@q?��*?�q5m��Q?��kծ�?���:Qr?�?r}�?옓uo|�?����"�?�i�~�݁?�q#�+?�2�٥u?��M��u3?��`W�?�؀G��?�m���}?�J=�J�        >��b���?��*�O�?9EG�I��?R��*ȈY?di=ݷ�(?r0Ʉ	?|}C�en?�jց�}�?��dF��?��W`���?���?��?�犞=L?�(�yn?�߰�X?����P�?�7ޅ;��?��K��?�U�Z��?�s�4�C?�ő�B�?�SP
[?�$A�5�?�A&7�?�X�D���?�>C�m|?�Ul��?ơ�oH��?�&w���T?��Y���?��<�X�|?�	��,?��z��)S?Ԧ�)di�?֠_���e?ظ,Z8�*?����$�?�A�LoKn?߳\���U?�!���	?�x���'?�ߜ|�?p?�U�T��?���p�?�rMCz��?��{l�?�Ϻ�De7?�?5~!�?�oo��iI?�+��?��Ln�?�&�+��?��Jl?��n�]Y?��z��6??��i�?�Dy`C�?�z�3��?�����V?��<��ɬ?�MBע��?����1�d@  ��M@ �p���        >p���
m>��@TV;�>�y�{�>��w31? ��W�?ՁDMZ?" !���?,[dy��?4��{��M?=M��<|�?C���x�W?I����(?P������?T��� ?Y�͗I/?_��m]��?c8�n�V?g��*�?k���h?pH��O�N?s,�LΨ�?vx9��?z5�0Zxn?~s&g�?��x3�t?�Q
�D��?�Y!��83?��C]��?���s�A�?�eO}8 �?���Ē4?�`�'�v?�G��l�?�{�%���?��YY ?����,�?��A(,�?�bQ����?��{P��?����a�?���� ��?��,pc��?��<�#\�?�����?���!���?��~8_E6?�,9Ww�z?��E�[b�?�5{pL�V?��]>S�?�7�1/�?���O �_?ƥC� %�?Ȉ���l?ʋ�UP��?̯�ir��?��r`B1�?а�E��?����D�?�VY d@�?����V�?�Ot�5�Z?����?j        ?I/���}�?�Y�9���?��8��p?�u�1:�`?�ؘ��?@?��ޛ�Ӟ?�«৤@�r��[{@����|@�$�X@�"�@9���@!��N��@6�I٦@!;�) 2�@#p��q�E@%�>q ;^@(��U�@*��4�(@-.� <*@/�<�{��@1f(a�@2�L{X�n@4��y��@6W+_{(@8=�?��/@:L/`�i}@<�h])?�@>�)��#@@��*LL@B%u7���@C�ʻk��@E2���@F��s��@H�H���@Jg����&@LK[K<@NA�So�@P%�٥��@Q3�䕔�@RK5Xq@b@Sl*��c�@T���L��@U�;���@W	���9�@XR�����@Y�ᛃ�a@[��-K�@\l��+Bl@]�����@_`.tE@`uel�,�@a@j�@b,��@b��y@c���0��@d��Ԙew@e���ed%@f{\�7l�@gn���+�@hh��@ig.u(��@jl[k6�H        >����b�@?(��Ép�?M�Mj�-�?e��-��?x%����?��Q�-Cx?���SHBN?��PA�>?���?�i?���<(_c?�m �/�?�޵�?	�?��'p.�?�I�sX3?�ګ�TO?I���^?�Oy���V?�9i�o�?�O�)���?ΒtJ��?� �jeL?����Z�v?԰Qgj��?֧�vDh?ش�QW�?�ճ��'N?�<�7�?�T�Y�?��Aۭ�c?��R�l?�TXu�k?�r�?tW?��%fT�?�U^FG5?�E̋h?�01�|�?뫽��:�?�0�_>��?�4r��?�+rQ��?��G�?��{��?򫩡<��?󊨲��W?�n�m�a?�WAt1e�?�D�mi?�7�0i\�?�/\���?�,8�g��?�.G��2�?�5��?��?�BX�	�?�T�(C ?�lT�]�?���Қ�N@ V���\�@ �җ��@�����N@ZU\Q�@��
x�@\��>@ C��֫        >~G��n�>��w���>��t�s?�0�]U�?����?)�IZ-�?6HJ&4�5?A���C�]?I�L����?R �3G�?X6��^#�?_��]�K?d}���?h��0F_�?n
R��?re���?u晴b	
?y�
�N3@?~K��v?���h�/?�K���L?�GVX�x9?��� A$?�0@Z�*�?��˪7?�C%�¡?��uP?J�?�C-�&�?���c�?�;4�᫑?��7��T?��r��b^?��"M$�?��@wL��?�9����?��`p��?���;�T&?��!W��a?�i`�>�?�)q_�[?�#���?�zvF2�?�>���n?���1b��?�(<��;?�����?�K�r5�?��U���z?�p#:?�)`P<�?��4CZ�?�����?�� �G?�-7,��?н�1~�?���x?��?�>y���?ԙ>��?�l����?׆��bxu?�sF�i?�:��+?���I�c        >�<��?-_�s��?Qo���a?iN�p ��?{S�6�?�y��%p?�\��C�?��o�*%?�&�_���?������?�Up�|%P?�)��~k?���?��?��b�
��?�F��r?��F�r�o?�M�b{?�ψ lY�?�m�����?�':U���?��!�I?��E��ro?�wU�b'�?�cF�N?ա��}]?�G$��ݚ?��A�<Zy?ڴ+hؿ?�z��$c?�Ku�Q�W?�6s$�Z?�����?���� ?��]����?����(�>?� ����?��,`��?�ŹpK�?�1Dܾ�?�L`I���?�mnXIĜ?�ҩ��?����p��?��_BK�?�5y5^Ky?�=c�ݧ�?��eä�?�Xg�?�@{znc?����D?�!�ɵy?�q����?�8�l�?��7~P�?���C��?������W?��eu(n?���5�?�s�B��?�mG��?M?�p���?�{���@�?��P\P        ?i�[Ib�?��&���?��5&��:?��D��Q?�z��l�@ ���F�@
��H@����=~@"2?-�W@!��j��@&�^�Q�`@+�0�;@0�@1 �@4�RHn@7~�+�@;&4kCJ�@?
� &!@A��^��H@C�9~w;@F؁1Q�@Ht����	@J��5�g@M��n��Z@P'P�Z��@Q��	t��@S%#�q�@T�b~��@VQ���@W��\'�#@Y\���d@["��)�@\��I&h@^���)�@`6�'4�@a&�^��]@b��'��@cJ�/	�@d:
�D"@e���@f+�`n��@g=�c?W@hT��07@ip����@@j��*��o@k����@l�@>��@n��z�@oT�%��@pI�cّ@p�6Z��@q��vs5�@r:0�"�@r�Գ9��@s����p�@tF���v�@t�o�o@u��ْ�a@vp�Ge@w0��t�H@w����.@x������@y�׹C-@zSbSxC        >��m���5?-;���y?Q߀1%&/?h�e�/;�?y��L���?�w-bt�?�׊�-�?���VC?�XW�X�?����b8�?��r�7�P?����6rF?�{��>�?��Q�C�?�Zf���L?�h]n> �?�^>��b?ê;o��n?�}��h??Ȩ��ۆ�?�ZAt� ?�,����?А�@�?��:Fw�?ӳ���E�?�\�?Nz?��O�3?���G�d?ڱ1	�9~?ܔl�e?ބ5ے�o?�@��@cy?�D��?�O3�2'?�^�E�@?�s��u�X?�����?欉��P?���=M�?���W w?�$��V��?�V�q45@?썛����?���TS�?�zo�K?�*�"b�?��ny�"�?�}�t.+�?�,�p:�?��~�]+*?��S͊ ?�O�S�:a?�\��ی?�� 8=B?���4[��?�Q��,��?�NF.!\?�����c�?��V���4?�mc��Z�?�5ʀ�i�?��H�Ba�?�ƋV�/        >ݬ��� ? ����{?B�1ږX�?Y+�HoX?h�Y��a?t�+���E?~��c�fb?��+�Eۀ?�>��%�?�r~�A?��ޫDr�?�עt �?�~?2�~?��u�g�?�2���o?���I?�K�Jo'?�G��i.?��h��&?�dV *o�?��ڍx��?����> �?�)T��V?��mh5V�?�����X�?���Uo�?�p���b?�p�1�v?�CIs��?�YXX4<?�z?���?ç�~���?��J���?�)`�%Ħ?���>x?��0l���?�[����?��_�9?̀؂B?�11���?�|}'7�?�lrl�Y^?�i+M��E?�sK�Y��?ԋk;�X?ղK53�?���>
�4?�-9�1�?ق�k���?��6��tm?�a%Hj>^?��c>�=?߈�DsX?��3Yd��?တ��α?�o}鬤?�iR�V-?�o?��q?���$*?��Ymf�?��6vp�?�
���f�?�T`R*��        >mo����>��!k*(�>�a�Ÿ�0>�5�755?V���%�?����?�v��?&
�h�(a?0aW��-?7fD,�]?@8�-��6?E��z�i?M7wE'?S��ë�?X��P4��?_v ��Q
?c���:�?h��X �?n�=�=Qf?r�n���u?v����l?{d8�@��?�b^�8"?�x�>�
?���Od��?�w��"?���z�|�?�Z�	?�?T���?��/��Q�?�&I�|�?�A9zi?�g��f9?��.E�?��E�}?�Τ��`?��_ �?�A��"�?�m<��,?��WQ.�?�g.�?�8��Y�?�B"b�?�º`��Z?5s��<?�\�W��?�Uo�f#?�k�(���?ʠ�٭o?��$Jr�?�e8f��<?���ۉV8?�Uh��h?������?�<^����?���Za��?�l"���?� �B�i?��
of]?��:��v?߼z.ԗh?�����:?����H\�        ?d�����?��Rc.x�?ˈA���?���X[�?��ti@ j�1%@�R�T@�?i2�]@L����@��{��@!���H�@%�Ҫ���@)�EP��e@.f�'���@1�����@4S�ec �@7&s�ۅR@:$�[up^@=N���Ԍ@@Q{�[ړ@B�9)��@C��R!\F@E�u~#b@G��f+@I�^��B@K��3�e�@N3n�"v*@P=���T@Qi� ���@R��fQ��@Sہ�갮@U���R@Vk��jN�@W�]o�@Y��00@ZvR���`@[�W����@]E�I�wP@^���c�@`�X��;@`�蝧9�@a�)<�f@bV){�k@cByT�p@c���3H@d�>nس�@e����%@fZ+��6@g4 i�-�@h~ 
@h�-'Qj#@i��Ʒ@j�a��U@k��s�@l�4�@m�Z�ʴJ@n��셐@o~a$��@p9�,Bu@p�N���S@q.����@q�㮗r@r"��ƣj        >��Z8�?/�&f��?S�H4��a?l�ыs!�?~�S�Kɑ?��%�D�?��Y�RO�?��̴��^?����,�?���J�y?�a��m��?�Š�	ڂ?��_�Ż?�l{����?�@O]�M�?�FY'��?�|�T�?��[�`�?�:��هU?�n��?��Dc��?�Ŀ�r�?�:N��?�o�� ׃?ܹ�a�R�?��� ?�Ź�,=>?�	�zӏn?�X-�R�y?��( �?�-��k_?��2[��?���<4P?�|���}?�
(e��?��G��j�?�E/B�?�yu�@�K?�UÝu??�7��z�?���b�`?�gb(s�?���-�?��"��I^?��2�K��?����n�?���l���?�
:��'�?�3HP��?�5�)�?�S��N�?�v���zx?��؊1��@ gn)��@��
�@��P�C@=�ӷ#@�L���@�Du0�-@,�D-!@֜�g�@�'�p�@4AD-~e        >���ϨR?,���'�?S,L��]8?l��uLi?�cb��?�#XBU�?���Vr?�hu�w%�?�@Y����?�"�އ�}?���o��?���j�8�?���9r ?�-�,?Ƃn����?�M��s��?�i�f�*?�l	��1�?��D���m?�Yoc���?�mw�?��#K���?�u0�N�?�$���"`?�ܸ|G�?��ڦ�?救�uV?�'%b�?걽N�?��ϼ&y<?�3�H�%?�͇���?�L�ꛇ?�\(�.��?��0|�K?�|L��?��%�Z�?�Iv���?������?�G��H?���Pʎ�?�����@ ��_��@���eۮ@��ʂr^@��"P�@���~@�*�N��@��n��@�3�q@���O��@
 �p�*@U��w`@���z[�@ڣ�c��@+��d�@Bz(�*@@�O3���@��r�@g	��N@(.;n_�@����@���X        >�4��p�>�6��s$?�6vw�?^�e�v�?/�QS�e;?=a��h�?H0^�/!�?RS��4��?Z'��L�?a�G�~�?g��Q�R�?n:ֵ��??s 
%}��?wy��&�[?|��,J?�8����?����<U�?�K���?��n'4��?���s�?�Z`�ǻ?�^^w��q?��[gv5+?�O�%
�?��F	�?�&��;?���.�?��|�H?���8�?�ت�V?�`����?�hKq�/�?���$��?�ى�z�?���`�h�?�k�W�@I?�9,�('�?���f�M�?Ù]��tf?�x��_��?�y92T�?ɜ&���?�⯟�ʲ?�Na��:?�o�+��.?���5=d?�<k?���n��5?�[�|�?�
�"F�a?���v�_?ۭ����?ݡ`��>r?߬��h�?���j� ?��+�[?�0<{�c?�gdr� ?媤j�z8?��(^)~K?�X̻Sa�?����K��?�<=A�d"        ?d}e�"�?�T�����?���.h?�W!#�HO?�$�8��@�e���@�C�H�@*0K�;4@ ��9y�@%�8�K�F@, ��<dK@1Z,s @5��gȺ@9�K2�)@=N󖻾�@@�_ٷ� @C^�x˜@E�ֵ&�B@H�dW (�@Kr�x1�@NefR6�@P����iX@RTڇW�j@S�j}x�$@U��SCHp@W}�rgV@YT�X@[:h��G@]0�5^�@_5���@@`��w�o<@a�U�W�@bϪ�#@c��i@e(���@fIKKSQ'@g��@h�7ż�@j���@kT�Ҿ�@l�K��@n��1]�@oj�v���@pj��FB�@q#x�|R�@q��!�@r��&�w@sb��9�@t)2^J[�@t�$���@u�K�LX�@v�����@wd�<�\x@x;�K��,@y=P�4�@y�����_@z����o%@{�W��@|��Y @}�1t�,@~z|���@lMsJ�@�0òY
        >�g�D?1�H�7�B?US�Q7-�?oH��&ZE?�$�J�W?�<��_�7?�,IX%�?���6�?��?(��?�+%<Z�?�����o?�e�XXM?�����?����Y�c?Ǎ߾�?�ca�?�{�P�?����	i?�8���U�?֩����?�;'�HB�?���&?���J2).?��KBbV?�o�&bb2?����$?��f5Bx?�T?ر?�a��,?�K�ѻ��?�H�wq?�V=j���?�+���?��3�/��?��9���?�!E�5%?�U^�u�?�����/?�����/�?�(pr.�?��:�=��?��Y���?�N� vG?������6@ !Y~�aw@ �3�d@�߃��@}>@��@P�l7%�@)�����@Z�w�s@숚I�c@։~p�@Ɖ�n�@���IH@	�EJR`@
�`t��q@�7T��M@��/�%@��@�}�.@�۴�Z@���	~�        >�1�x�Ά>�fED��>���`�?X�{��Q?(���]?7WNm)M�?C(Rr�8?Li_�)6�?S��[�|�?Y�L�P?`q஼4?d=Y���?h[s\ʦ?lʷh$u?p����?sPVK���?v@{%��?x��N�d?{�6��M?F�(�p?�c����?�B�l5?�C]&�	�?�h=�r��?���(�8-?�+���a?��gy�?����'�?�Z6&"Ƚ?�����"?���!c=�?���AR� ?��\�B-�?��\�PA?�$r�(��?�Q(��U?���ew�%?��k|?����F�?�@J�y~f?��.�?���)���?���ti�5?�0T^�y?�'�m�*=?�`����!?��K�?�C��h?����G�r?�"n.�8?��V���?���OqV?��T43_?����?�T#Ь�i?�vU�m�?©��
�#?��W�AO?�F|mA9J?Ʊ����?�1{$��?��~.�͢?�o�(���        ?��ऑZ?:�҇'z+?_,���)?vQ���f?��S�d�"?�YX�H,?��f��;�?�z,��?���Yv<?��L,��?�Pu�]?���c���?���`D??ǠvAmc>?�rg�@*"?�z�_l��?���}��?�\���?�gs~�h"?��54�-A?�fI_��?�K�TB�?�nvˋ*�?���?�?�h́�(%?���Pk��?�>���\?�_}`_\�?�+'���?�	̬��?���ZF?�.lN)?�����?�&��EJ?�J?2N�?�xԂc$�?��C�c}?��3z8f?�K��h:p?��r	 �D?����?���V؋h?�q2A��?���� �@ �E	��K@{�����@Z,�|8o@?��Q�@-u�
@!�7�wP@9a��\@"v���@.�Jv��@	B�.�N@
_'�V�w@��:�@�A,��@��$��@"s�~@3�z6@�D�:MF@���+��@3�X�R8        ?q^��$L?�őǞ�N?�Cu�,dq?�X+�p�?�B���Kq@7o"�@�����@�]�
�@!,H2@&�#�H�p@,���=�@1����#@5�8&���@9�iҾ@>aċ��@A��G�@D'	��@F���ú@I�4'H�D@L�9�:�`@O�u��@Q��ۍ�E@S]����@U1��`s@W���"V@YW79�1@[-��d�=@]W^�ނ�@_��lj�@`���@b+p�Q��@ck��Qw�@d�`�T/�@f��=f@gl�]�@h��?�@jL�"�j�@k�rfP��@mX��.��@n�yz��@pH�d�{�@q��٪`@q���G�:@r��|W]#@s�`|7$�@t���7��@u��%�p@v�N~61�@w�����@x�X���@y���o��@zȣ�ZR@{䊆���@}뷈��@~3p�	�@f+Au�@�P�ɼDv@����h@���S��l@�C`���@��pƐ�@��{(�@�^@N�:3        >�P�,�3m?	����?1�	-��?K���L�$?_�"�TM?nX#��?x���9*?�ݒrt�?��k���?����Ꞔ?�8����?�,;ڮu2?��Z8��?���WCk?��4�4�?��seot?�8{5� ?���vX5?�Z�`�D�?�,�?9SE?�)i�-k?�Q���?�Q�1���?��L�?����?��,U|��?���޷�i?��ƌD�]?�#�A�?�Z[c��?��b=�-s?���z�?�[���2?Ԯ����?��(>�	?�yOj�X�?��N�E?�v�S�_O?�>�
y?ݦ���|�?�Q�:u��?���8?m?�g�7u�?�Qٴ��?�A'lWp?�8H��.?�6BRń�?�;��ŘU?�H��+��?�]A72q?�y�#}�?�0n5VK?���	`��?���|�7C?�<��*�?�X7�?�h~H��?�����q?���)Yd�?�w����?�0�V6|?���I ��?��*���        >�17���?��!O��?* i
�?D2ծ�t?V��"#l�?d�2����?ptR�+��?x��R��?�cܰ(�[?�PE�8�?��3���?�FV����?�c�=��?��C�}pO?�)��V?����s?��Vx�+?�ʀ�J*�?�ۃ<b1�?���,c:?�<�!�-?����#j�?��E��+�?�8��	�*?��gLG?���4�8f?�9�ϟ?��ne��?� l+�7?��m�þw?�;�D��?�ޣp���?�� Y���?�Q7	p�i?��d�$�?���ϟ�+?�}�B��P?Âf�G�P?đ��"�?Ŭި�?�ҊI��?����x?�F�YaX�?ʖ*�x�?��2��?�d�p<3?��E�sa?�=Zs��t?����?��?��j?���&���?��,ǝī?�ו[@?���D c=?�]�.?�;��\/�?�}4Gl��?��5KI�?�5r7Q��?ݮw^�s?�<Bo�?�o���.I?�Mj�u&�        >�9Q�P^?,B<��?+����(?E��Ѱ�?Z&����?iv_�<��?u�@�!?��C��h�?�� ��R?�R�����?�U�7t�v?� `���?�����?�"2Jg��?��vx.>�?��(��?�D3���?��P`A-?�?�A�?� 6c@g?���}�E�?����?�?��f�b�t?�p`��?�KO���?�@l�i�?�Q#���@?�~'�\��?��eK *M?�0��=�?��+�HTf?�/��K?ӔTn�i?�	��5$?֐��C�?�)c+�w?�Ԭ~o��?ے����S?�d��)f?�JK���?�mB8�?ᩁBz~x?���Z7]?��!����?��4/�?�6Yw�� ?�v�Q_�?���Ƣ�?�_��Dq?�o��2?��1�?�z�6�?��JU?��[c�NK?�3!)?�g����?�o���#?�]��ۏ?�T)��d?�R���?�Z6 (T?�jq>l;�?���j�        ?D�k@\qY?�U�5�ga?�٨�6G�?�d�WJ��?�	~����?�j�|G3?�͈Q5kB@ f]{2��@����@م�e��@�	 ��@Νj>>o@D]?Z@"'�ĺ�@%W��d�@(�1��@,��(���@0@5/�h@2ZȽ�
@4�f�t@6����c�@9di���a@;������@>���Ry@@���t�%@B;d���@C�s-@E]3���@G���@H�j���@J�=m{�@L`r2��@NJ2J �@P"P����@Q'툈F�@R5�uk,�@SL}��6@Tkzr���@U����O]@V����� @W�=�no�@Y<,��@Z�v�z��@[�p�	�@]2$��g�@^���W��@`:�t�z@`�@�@a|�7q@b@�_0��@c
v�t� @c�Dv���@d�=v*~i@e�o�)@fd����@gH�&�r@h1���^y@i����I@j��J��@k��O��@l
�k��@m�V�"�@np�|6�        >��ʢ��?'��S�?NE�_�5?fk#��n�?xw�H(-?��+�O�?���0/?��3kZe?��QU��?��0�rC�?��;^8�?���T�R?����,׏?��dv�  ?����w�?�S��a�?�i�Jx�?��%�r?�/N���j?΍�\���?����?��ӧ�Y�?��ݡ��6?�n!a
�?�^ �\��?ۼ�2���?�:|+y�
?�lFKtbM?������?�<$�e?佔��}[?�P�ub*?��N�G�?�PI*b?�uV� Z?�Pn�־?�>��N�T?�񀮞�?�r!K;�?�0m´�?�ީ���?�	f�x��?�?�AEuF?���ZYE?���)�8w?�-m᧒[?��{�z��?�	�a��?���EV_�@ 
��9@ �r�,��@���\,&@~���(@Z��z�@;4Hİ�@!��\�@p�>l@���y@��4��Z@�����@	�wH�o�@
����@�]�G�        >ѱN��:?���u�??_d^�?XJ㸃�?j����n?xr�K1�?�N�;bR?��	�Z@?��!�F��?�4tLFV�?�5�a�&�?�[��,�?��D4	��?��Z;$@�?��I��C?�߉+��?�(�[��?�m���m�?�㬫��`?�zaM��@?�2�('R�?�&� �d?�� �1�?�����?Ŀ�l�=�?�y�Y�-?�H�����?�-���?�'e��u�?�8s�� b?�0n7\K�?�P��T5?�}t��L?Ӷ4
ͻ&?��2����?�Om���?װ="�Ț?���|U�?ڜĚ�??�'�\�F?����o@_?�m�ޖ� ?�����?�y�����?�g�z�P?�^|�nyJ?�^E7vC�?�gR�^i?�y��`��?�V�V;�?��t�H?�����+?�)%�I�?�or3�x�?��׎(��?�����X?�B�jd9�?����$?�O+Q?���C�?�P�+h�	?�$��ԛ?��0�g��        >�A*̎6�? Wi�%?"�@쩩?:��W�?L_%��ZL?X�[� U?co`����?kѬ�t_?r�Nۨ�
?x�á�?~��_b?�9�pD�?��f���|?�w��KJ�?��ϴ��*?��M��.?�F�z:;*?������?�6��?�g�C��?���n���?���b�?��(�.��?���%B�?�Օ�Cu�?�KRߡ�?��2�?�>,�F��?��%BK�S?��-�B�?��؇��=?��d�f� ?���MbZ�?�̎,H"f?�$�GE?���@�?���!�~�?�9��?��2��?Ş|��C?ǉT��?ɝۣ7�?��]+�&^?�QB��7?�{���?��Gt#ª?�v��HEu?�#d���?��C���g?���j��?�����?�>��`��?߬KZm#T?�$W|Q?⊢a��L?�)]U"9?�6,��?�`[�?�8=����?�0��;�}?�KӬ�b?c���?�����m@        ?a�� �C�?��L͘�?�C7)JS?�hL�Xv?��0�W8?���3K�!@^�!*F�@�����@U,��@ޜ�I�@$+�H �@(�D=@.ߊ�>@1ԟ%
��@4ࣜ�U @8)D��@;�����@?rʇ}5�@A���ve�@C��=�`Q@F��@H�����)@K	�K�{
@M������@P?� ��@Q���"9�@SB?��@T�����@V��*�F@XR���Q@Z(�{ᗃ@\;�oI@^�WAG@`
�c1s@a%[��I@bB��W�@cj�dc�@d��y�`�@e�KXz��@g �Qd?@htk	@i�"c@k>{��@l��aqg@n;��"$�@o͍/�ڕ@p�pD�@q��g(@rg�Y��@sHW҂e@t/W�F_v@u�4�g@v�hkVI@w5����@xᶠ��@y��e�@z/I���@{�m�x@|*��e@}A�l�u@~_~D�)@�!��6@�U���$�        >�o�5q�N?$����?F�0�5��?_�Bì��?pj��(�?|�H2��?��Eo��?�L
�2.?�Tjc�-?�]<��?��jH���?�Bj�3�?�W����?��> �M?�wzT9�?�y"��?�&�rױ�?� ;ݾz?�����?�?�� ��?�pM.#�?�
t�51V?���;�Ik?θ!�̡�?��=~��?҅F=u@�?�9{!ЙJ?�+ܥ��?��_X*?��6�t?��
�wT?���6�?�~�V�?�G���s?�|��I�j?��T�Y�?�EΑ>�?�g�a��?��>a�?�HjN��?�ͧ���?�a �?������?�Mĭ?� ���?���b�#?�?��D�?�?`.?�PE���?��9�Y�_?������+?��!�KE�?��>��]?��5`� t?���B�?�F��3�?���+A��?�Ƹ�P��@ 	q4�.@@ ��٧�r@b*f�@�tj@��k�        >�T�u�nW>�����T? 2����?7X"F�;t?H��P��V?VPH")%?a����π?i���W�4?q�ܺł?wq�܊��?}����?���� ��?��P�X?��U���?����
�?���3��?����?���K,5�?��kWQC?���,���?���П�r?����@�?��V[��?��g�]wj?� ]UYC�?�~���F?�qpe5?�Dn�2?��M?�ETYvE?���[��?�����?�9K�y��?�/ӑ?��"�Oۄ?�t��m�?�HkY�Zz?̴B�o�\?�N-�s��?�,woս?Ҋv�Ȗ?�#�P�I?��㉄-�?ק!�
��?ٔ���5�?۠�N��?�̳��!�?�����?�C�$�m�?⌟���?�緳��O?�U�
�[?�׬%?7�?�ni�y�?��l��?��:u�̈́?���=��:?林C�%?�ى[�fS?��6J��?�I����?�<zڭ�?�z�]���        >����|��?�K��oZ?*T9�O?Bi��3�_?SM��	|?`�.��$�?jx� �?s4t�M.?z��&H�?� 8g7��?����B�X?����K?�Zp}�?� JY(?�sc(� ?���?��Q-u��?��P���?�=�evS�?��u� ,?�|��<�?��	�J�s?�y���?�6���R?��L�
b@?�[�Q�%�?�[N�:?���iˤ?����8y"?��]H�?����y��?��Q� ?�mX��8r?��f�yE*?¿�aiU�?��oG��?�F��~Fe?Ɵa���E?�$�Vb�?�~�it?���$?̟�̜�\?�JF}��D?��o�!;?��a �?��?�OV�?��
^�5?��>D|�D?��.���?�/a�?�3�E��G?�f��K2�?٥�$x1m?��#G�?�I�\7�?ݯ�R��H?�"����?�Q��2�?��*`�	?�����?��
��� ?��y9�R?䅍7�        ?^�(���k?�܇�je?�ڌjB�+?��C�H�?�����U)?� Oڅ?���3�'s@6�P)w@�)o�>�@K2|�ݨ@X�¹p�@g&�GW@!��4?�@%E�^�tY@)-f
d6@-r����@1�Nx�v@3�!�RH@6C�>1I@9+aaf�@<E4MpM	@?���:L�@A���x�@Cd��w� @EY�Gܣ@Giܶ+��@I�".	�N@K�(�{�@N?S�:F�@P_s'��@Q���P�M@S
~��
@Tu�}��@U�
���*@Wx)C�%@Y�-��j@Z�2��<v@\q�`��S@^:���e�@`
e,�<@`�'S�j�@a��{-sa@c�)/�B@d��T�@e)L|�X�@fI�gu�j@gr�����@h��C�s@i�rD،@k$a�K�Y@lq�d3�@mȞ����@o(��Rx�@pI*M��@q�$�=�@q�P+ƥ@r�7ǩ��@sL=��<@t(.���@t����"@u��P���@v��,D�@w~�R?�^        >�2��]>��M���?!.� <?�?;��pR��?P2�l��?_ZdJl?j%�዇�?td���?|�Â<�K?�x&�Vh?�w����O?�)L���T?��u��6?�W�&�?�K�Hi7?�.)>B�?�vSTC??�'�"5+u?��A�{�?�!��ޓ^?� Ĥ:�P?�`��?�E/���?���%���?�UH��]?������?�j�*��{?�%�&��?§�*�1X?�;��x��?���m���?Ǘ��O��?�`T�\?�:7���?�%l��	c?�!�3J�?З�Xy�6?Ѧ� b�v?Ҿq�'?��n�ނ�?��3�a?�7��:;?�p�.��$?ز��ذ�?�����T�?�P&&sI?ܬ5��K�?�GG/U$?�z���?�{w� 1W?�;�o_k?�U���?����e)?���s?�nĺ��?�G�Kn�?�%Dө'|?���Bl�?��Z�![?��C��?��i.��?���>�s?��GƟ�H        >�vp<Q׬>����?BnF�6?/���a�?C�
��?T_�����?b9��W?mH��K��?v '��?�Y}w� ?��
|��Z?�di��?����j��?����ƞ?�'���?����w�?��ʎ��?�T���7�?�K	�Yi?�?�N�?����1?�5��@��?�C�����?�]|�Me?���
�UL?�}��J�?�g��ڹ�?̒�爕�?� q���P?��~E�E�?���x4w?���qi��?�G~�v��?ں8�!�?�V�~�?�'�V��?�HpA�?�;���?�{�y#�?�zpy���?�P�prG?�@W��*�?�I��v�?�m���6�?�VwQoƋ?�Ē�?��*�{�?�
�dP?�cʒ�?��*��`?�Bi��?��F:^�?�_����?����f+?���ҫ�@ B�@/�\�@$�v��@!�+6��@(��Aû@8��r�n@R?K<Z@u7W�9        >�'tx�<>�lx*�F,?37�s�?c���?1�G���?@�b[�-n?L\DIˀ1?U�$໔?^�VWέ?d�D���R?j�h1��E?qDA
�?t�J��F?yYp�N?~1~e�??��B��h?��e]#f`?���$�|?�W��� �?� 4���?����*J?�ׁ���?�@d��C?��N���f?��s�ۄ�?��=����?���	��+?��0�'2?������)?��R�OoI?���z �?�2H�Go?��0�?&?�1�J70"?����Y�/?�)Y���W?��%���?���2�J?�f=�Ν�?�`D�s�3?�z(�`,?��a��� ?����`CK?��y��k?�[��f?ć�k'�<?�̕�3S?Ǘ�yZ��?�A;�4M�?�B�,B�?�ۚ��\?����h	?�m4�S-?р��)?ҡ�K#�J?��:ȑ�T?��x�?�[��f��?׷{�-x?�# ����?ڞ����?�*��A?�ǜ�f        ?)KM>�o&?j�>�X�?�EY��S?���|/n�?���	;�?�q,_1�?�m�n�?�[��W?�G���?�6��ݪ?��T�>@y����@	�gC�O@R	ڜ=�@�.\�@e�E��4@H*�`@���ϵ@!�:%@$
����@&����K@)�%���@,�k�&�@/�v�F*@1�>��bc@3v�G3@5`1�c-�@7c�#��a@9����X@;�̠��@>˾�Q�@@7ȥ�'@Ax�.π�@B�kr��
@D/��m�@E���@��@F�A`�ܛ@Hm���@I��8�#�@K�w���@M�໵l@N�w~H�D@P;���@Qai�@Q�o��F�@R��N�8@S�D/O�`@T�	n�Y@U�=K+�@V��8uH@W��JW@X������@Z"$�w�@[$����Q@\K:����@]y?b-��@^��h0Ƿ@_�ݓ�@`����@a=�S[�@a�ĳ1
@b���	��@cE���        >���v?�M;���?)��1�1?DHr6��?W.��?er�0F?q���Tq�?zPL�q,?�z`���?����o)
?��=��?�u�@e?��z.��?����]��?��0����?��YSV{�?�/����?��% �ܛ?����V�	?�ߟ���?�"(��!d?����ز ?�&���9�?����ܜ?��e�ݍ?������?­�c0�W?�r��C�N?�Q��,.?�K<��?�`	��?̐��Ȃ?��IG�?Уf�'x?����(�?�9"��}U?Ԛ����?�����3?׌Ī��?�����_?ڽ�}?�mѠ\��?�/��?� ���EL?�����ID?����z�x?���6?����j�?�|^2�?�+᮹��?�Rl@rJ�?�8�|��?�b�<�?���U��?�J7��x�?�����?�����~?�4�H�;�?��L���?�	"4�Y?�p�~j�l?�9ƃ|�j?�ޛ��        >����	'>��ĩ�?0��[��?/I�T���?A��w,{?P�ԥx;?Y��7?cV��?jU5>N��?qZ,���	?v�sA�?{R����y?����[�?���o�^�?�#>��$�?�ڒp�8?��!�=��?����(?���}�TI?�m�X��?�ܕ�E�?� ����
?�fè�?�5���!�?������K?��SR���?���<q�?�":Q �?�z�3�3?�����?�Tݰ�l�?��X&~%r?�J��;�F?��k�
�?����i?������p?�{Sz���?����ȼr?�����?����D�?���m�'?�(gS7[�?ď`�H��?�
����?ǛP���q?�A��z`�?���ݡ�?��OD��?ο�CS�?�b�;;�?�rU2S��?ҏ5��V?ӹ��L�U?��~.ľ�?�9�u���?א6�Jb�?��2�#]"?�lB׸��?��� >?݊��}n?�3�u֓�?�w�3���?�^�L״        >�ũp�1�>����W��>��J�
$
?��
o^?(���Ú�?8���B�?E:G����?P�Vn�-�?XT.F'�{?`ݸ��|?fwy����?m/�-?rL��N}?v����?{�����?�����֙?��ޮ��]?�nJg�δ?�z�K��?�O�@��?��k^q��?�_J`u5�?��)��?�*J�`?��gnF�U?��16�?��3��{!?�(n����?���4;B?�Z���?�y��3?�v}���?��{��|�?��S�c
?����%q�?��"P�1�?��a[W`�?��J�/�e?�t��?ň��h�?ǽ3��p&?�gz���?̱���}�?�v��i�?�8��i\X?�ғeJ��?Ԋ1�T�;?�aGˬ��?�YtP��?�tZ���Y?ܳ��5��?��P�?����q�?�.�\�u?㞶�̜?�%��é�?�ï&T�;?�y�����?�Hqk��?�0� 	uY?�3�j�]D?�(�_�4�?�E��z�@        ?2̡�s�?v���n?����B3e?���=�?�A�Q���?�V3�<�?�6���C?�|��#�?��R�{0?�Q�H|�@[��X�@8��0�<@��a)3@���F@ /sPb@��#p�@��G��~@ cL	��u@"�����@%W\U�@'�6�K�/@*�� =�@-�D���@0e����@2Y��>�@3�T��_@5�}��S@7�"��g@:%5^hĜ@<sd��U@>� ���@@�l*+��@B�K���@Cv�f@D�P��2@Fw�չO@H�I̼@I�*�m/q@K|T�6F@ML���w@O.ozM�@P��D>�@Q�Þ���@R�c�:��@S��b�@T��<nY@V6Ny�@W<�d(u@X|4Wm�S@Y�@9@[�]�"�@\z.�g8�@]�Z�>�@_Y�]]�@`l� i��@a2�fb�0@a�;#U"@bω���@c����or@d��X�@ef�9��@fP)х�@g?��5        >��s�7%�?���-?=d��'3?U��A��?g�B8s�?uh�H3�@?�6���P�?�k����?���]d��?�e���i?��&=@?���/���?���sg��?��c�?�ٌ�6��?�5�q!?�?��Y-?�-�@֞�?�HK~-��?��a�x�?�4��?�Ј6�w�?ĵ�2���?ư&�!Ǯ?��Ii}Hp?��ޭ<��?� �	��{?�p�Hx!b?���{���?�'��G?�n�����?Կ��t?�mG�]�?�@R�qN?��{&��?�f�m���?�����C?�w�)�L_?���K"?�Yf1g?�0jɖ�?����U?��d@j��?�׊�ՙ?�Ŗu�
�?幡���M?���lo0?�S;N?躮ɄO?�ǥ���?��1E�?��	�a�?���ڠ�?�<�h�w??�j���L�?�O�GT�"?��Ҟ���?�1QoV}?�4��-?��~���?��5��?�8���?��f
��        >�DL_گR>�%�c�+)>�M� ��!?
�4��?L�q=�?.*�5�?9gSx���?C�<�C�?L5{̓�?S`��U�)?Y����)b?`����W�?d��5�3?i�s3��[?o)]Ý9t?r��]�i?v:����m?z*�NGǐ?~�`�L�?���o��?�f\����?�]�U��?����6n?�4ćf�i?�����?�4^�L��?��:�Iu(?��N�I�?����Eq?��YyS<�?��u	�ğ?�f�tk�?�Y�3[s�?�yaZSDC?����W~�?�HɚZ�p?���:�G?�x{}+?� M�8�?�Ț:�?��}SS��?������?�σ5
W?�#��[�?���P�?��`8;�?���h�?ë>�1N�?�Uq����?�)*9?���X3?�$"G�X?�?Li�N?ϒ��))?�����?�Ygu?��s��5?�@Gr�p,?���_{�?؆��aF�?�PT32�2?�5\�]2�?�6��c+y        >����	e?ns�e2?2b���?J��TM��?]�;�#�?jmM&A�B?uQEUt�+?�Mw�o�?�	鷱��?�[G����?��C�W�?����I�?�䴉Ӹ9?�\W]�o?��T4`{?�\��?�ȳT0oq?��݁��?���ON�?�l=m��?��k�H8?���%ǰ?�d����?�fx��/f?�L]���?���тt�?��s�A?ƶY��@�?Ⱦe?�#�?��fV��?�0ӧי�?ϟ�M^�?�����\?�{@�>g(?��H9>��?Ձ�yJ�?�+���?����??��0D��?���GEU�?�	����?�w'i� ?���WHF?�>�k���?�il���?�/� "X8?��3�:�?���)?�n���?�oxcԷ?�/�0?��F04�O?�+p�y?�{����?��E2?�fm����?���1?��Z�c��?�� 2c� ?���͕�!?��3��.�@ �oa�?@%�Mf�        ?PH�q?�ө�R�?��&.���?���S�5�?��KB�J?��?��xH?��Z����?��jA|s	@,�[�35@-j�@9�+�@ԥ���@�VwT�@M�Ul�@��z��@!�9v9�@$��뽃@'y���Q@*|Fg�w@-�y��@0�p�0��@2A��qs@4Mɯ�Y@6 ��\�@7�>-��q@:����@<6� _�@>p�ܥY@@_:�=j@A���L�@B�^b���@DD��\@EX�R;�4@F����=\@Hk��a�@Iu�R8�@J�i��]@Lb�9I�=@M�K6+��@Ow�[�M�@P����@QZ�q��@R1��l�@SV���i@S�cT"
�@T��g	�@U�8�B�@V�.}v��@W��.@X����o@Y�3*r�@Z�є�-c@[ς�g��@\�R��۱@^L����@_&{K~&&@`'�)��^@`��g�1@aZ����@a��)!y@b�R���@c>㢂�a@c�k�C        >�8���&?0��E�k'?W�-��D?q�%ٟ�<?��b����?��*�?�K;�`��?��!�()?�5��Y�?��psD?��z���(?�F���)?æƻ�T?ǖ� {�t?��}s�?�KK���?����TG�?Ս���}�?�x���X[?ە�#X�?��Ň�m?�3"�	?�G�ޖ?� �5���?�g�E �?�5�>���?�v�>�E?��x�~��?�$"����?�lH���?�����?p?�$�!�`?��U�� ?�"�j��?����jZ?�8]3Rd�?��ŝ]��?��4<?�X��K�k@ �Y��4@���+@}g��@{�)M@�_�U�@�S��W@��RW��@�"�z�@�ʐ�S@
�>�0@Ig��@��׃�@�3f�
@��D�a@5k+�@�RM 8@��KEk�@Lc�&@f+>�n@�ѽ1�@�Yᅪ�@N��@ڭ1�:@��o�=�        >��l�R*X?6vz���O?_)Ɨa?wȔ+rYe?�P��cS�?��j�՚�?� 	 ���?�Un$�I?�D��&��?�H~�?��?ö�0˖#?��Eϫ?�rǢ�?�fK��3�?��+��@?ՋYdntk?�X{����?�LU1go<?�f�Sy4�?�����O�?⇜^ս�?�N� kQ?�)E\��F?�u.j��?�~m�M�?�/�)<'�?�ZBս?�?�Lي`��?�w4O)vr?�r&�}?���$��"?�8�pK�D?���>X��?��LF�|?�e-!�7�?���cX�?�nH1#qY?���N�?���0��@ �p�"��@���\7y@�}��@v�f�K@s��gA�@y�va�.@�H�Ww�@��Q��@��6�U0@	���?@/̦hyg@u�0�@�f|�@b@%�wn2�@H��@#G��G@șP\�@�G�o\�@enNy t@?N�X n@!.ӆ��@Vls�7@��,b        >��:�!,�>��e�!u?��2j�L?2N�Jc1�?C�'%G6�?Q�_�4��?\����?d� �Ƌ?lb���:?r�nC��?wP B��?|����Y�?� �\,gz?�/�y�N?�uBgTT9?������?�����^�?�J��=T�?�a��H?����d�?�����sf?�j�����?�5o�,T?��R����?�e���{�?������G?���K���?�h��9?�LB�� Y?�O�n@�K?�v� ۮa?�Ê��_?����DM?��?��m ?�Wy<6�0?��+�d/�?�w�'�F�?�2�= *?�����\?��'^(;?� +�<Q�?�/�I"�?�a̵7��?§�J�?O?�҆�
?�q�[8+�?���b�?Ȕ�L��&?�J>wZWK?��aP\?�F bs�?���_d�?�����p?�1�[p�C?�`z�73P?ԟ0�W��?��#h��?�O��E�?��X4@��?�G��9�X?��:hiYs?݌WZFg?�L�ߑ��        ?c
�|e�?�{�?Рw� �?���w�$?���q��@
x`��|�@p���@�cQ��@&),\KԒ@-v� ^�T@2���@7��M1�q@<�3�� ]@AL܏�@Dr:緼�@GݱJ���@K����,@O��Z�u�@Qᬧ:)�@T#�r���@V��}Eo@Y�11$�@[���yi�@^���+AJ@`�a�v��@bMV����@c�I�6.@e�H�;�@g]a�Ю@i1��Rӆ@k)ZC�@m����y@o9r�Q�@p����Y@q���**@r֋�9��@ta>;yv@u5��s2@vsx#���@w��4H��@y F@zf�:k4�@{�ֱ��@}:�>���@~��]c@����R@��q�d�,@����5�@����Ν@�V�B���@�2�N�ޚ@�u-]��@����n}�@��1�쫽@��d�gV�@��0V�~@�Ϝ{�s@�ҳ4ϙI@��~�zȉ@��cBj@��h�@��@��[�h�@�i���*        >����pa�>��=<=<?+ɜ|1?7#�0���?J"]��"�?XJF�?c��O�K�?mp�~k�N?ty �w��?{�B��?�E'}Q?�b�(�,�?��0��?�ý��y?��|���?��at;"?�֭ft$?�
QX?�o*%��?�4r��?��B� �?��$E��?� Hm�V,?�4&�0?��:���?����m_�?�:v��X.?��:��/?���-6�?�[�>�?��q�x�?�f�rۍ?��ZE��?����ð_?�jR�o�l?�5�O���?��L�>?��G��*?��%VVXp?�;ԙg�?����׭?�'�3��/?�F��+��?�o0�oЫ?ȠL�=#?��u�a�?��7��?�ju���?����[?� %�'U#?�D�ڲf&?��8��?Ѽ��/+h?Ҁ9Mg��?�H۳���?��Bv��?�龽Գ�?�� k�7?֟�X��%?׃�А2?�kʤn�d?�ZW5�?�N$	zA-        >��.IQG>ȑ�XA0�>�(^P�V?&�0
Z?"�� a�?1�`�Cf?>�`ˏh?G�����?Pr�iJ�?VJ{�i�?]
�j�RL?b\V��S?f�Uѵ�?k�=�X�?pt$�9�?sq�>�W?v ��j?zn;�D@I?~}��E�!?�}����?����?��O�8�$?������&?���g[�?�f�wK�?�q�Jd�?���;�<?�.S�K�?��E����?��v��?���<��?��o�?�ڍL��?��C?���?�O��Ad�?��S,M=)?��y�k�F?�@�����?�׃�x��?���-5��?�eF���?�^���#�?�|̛�?����mo�?�,<�=�9?�`��+��?���2��?�77am?������?�j�!���?�)��"?��VD?��Kv>��?�i��ջ?�6���1?�?���
3?�tw��?ӹ?��\`?�eD�?�tl�đ,?���u�?�ur+�?���|$�        >�ng�>�]�M�J?��r�?%F��yX?6��ay�?Dc����?P��ԟ>?W��!��?_�dA3?d�0e%?i��|6?nqJ�r�?r'��F��?uU>-��?xƳO9�2?|�vi��?�G�H��r?�{��ߕ?�঱=�7?�{��H��?�QF!��w?�f���J�?�`jv1�?�2�tfr?�,�B��?�Qê?��?����J�?�)�|�B?��O+���?�l=h�EE?�����?����'Q�?���=:�?�����n]?���}��?�7��	?�����3?��y�x�x?�Ce��>?���Բ(?��4�;?�vn"��5?�v#l8�?��#:��?�炉(�?�.���?�����?�眍\Q?�g�
MF�?���q{?Ƿ#AG@�?Ɉ��=��?�w�X���?ͅ����?ϴX�O�U?�]��e�?�<>����?ӈ��U�?��F�N{�?�\�`��?���;�?ك�CmQ�?�8��x{        ?0�M��?i�t��O?�YC�<?�ի����?����a�N?ɨ#ٸ�p?��7?ާē��h?�-�.�0"?��hfi�?�ݡ�8�?�����C?�6����/?���x�D@��@�B2hL�@Ƒ ��@
�n�}�@,m[��t@Ҟ�_��@�ҮT:�@�?��8@�Z� 9�@��سg�@�y���;@@l�V�@���5��@!"�o�)@"k~��>b@#ʶ����@%7�n��v@&��4��@(=y���'@)�t8�@+}ws	�@-3��[�<@.�@�-J@0f�H͔T@1X�ǋ�J@2R�e�e�@3Tu�i@4^ ��U@5o�����@6�����I@7�n��Q�@8�t��@:,y��@;G�.���@<�>Q\W>@=�ٵ��@?3���$-@@Jr ;wC@@�Шt�r@A�)�"S@By,��@C=Qd�0@D���UD@D�����@E�m��'�@F�@o��L@G_m~�F@HC�L�9@I,9��        ?��ЮR�?U2&���.?zq(��V?���z��?��ENcd?�y�~��]?�6��u�?Än ���?�fu?���حi?�qXdX�?�6�E�vU?�f�U͍.?�=E�fk?�}_�S�?謵(�H?�J�S�?�eU�?� @��?�[���?���3y?��'����?���q��?�cB�Gc?�̭���@ �vp���@������@H����@��BB��@0/�#�@���JJ@	0?�rj@
������@<;��@����X4@���m @��<���@�l�O@n~���@[,H=@M�,�M@D �`�^@@*���@A���j@Hd7y��@T��+�@f���L@~�޴��@�N�n��@�&}<$'@�5WB�@ O�|~@ �ŷ߁@!G�r/|�@!���O�H@"�w��	�@#8��U�@#�{l���@$��a/�4@%Ỉ2t@&L/���@&�O�S�2@'z���K        ?w9�}<?[k��2^�?�d���1?�Ȃ�!U�?��%xx�?�z�����?�T��D�?ȟ�}���?Ё��0}?�8
D�De?�m9�\¼?�G^�?�#����N?�s{�7��?���Nl?��C�P�<?��dӨ+_?���zK?�%䰷��?�p�cu?��4����?�N����?��aX�ى@ ���H@<���@�@��@���P�l@j���w@�!�y�Q@	nw�ɸ�@
�F����@�%l�@#vlm-�@�	��o@��P���@��a�L@X�]&@0���\@	9���@�8 o�@�eU�@�����E@�a�P@bR�0͚@F�{�k@-�F:y@��۴�@ �pY#�@��[�Z)@�_g|�@��'�
�@�L�+V�@ aq>���@ ���f�{@!_槶[2@!�ˇ@"e,�@"�z9���@#q��M@#��LQiS@$���,a@%����@%���1N�        ?h�m��#?3�sl{��?R��t;Rl?i4lj/IH?z<�>P�:?�!13#i'?�)po1�?�=�ou�?��'�S9�?�1�j1b�?�)7�q�i?�ݑ)��?�t�Wj?�Xġv��?����&�?�	���-?�u���?�q8�e�?��~| S�?˼}+��?����#�?��DI�
?�����{�?ԫ��ak?֞�R��H?حy�eұ?��'���[?��k��?߅%�/�"?�{��\�?�U�b��?�\+�?�(�2+5&?���?�=�`��?�ᶧ�@?�PA��?�\\��8�?�3T�F�5?���K4ݚ?�E���D?�`�J�?��-M>?���}��?��qO�/?������6?�-�IjN�?�i&<�?���l$�?���W��;?�W����?��jd߄@ �?�U@ �}R�'�@��l��@`0I�Y@/��m4�@�~5L@��f��@���f�@�9'@�j(�dJ@�j�q        ?���,J�?��.�$e6?�	�s�@\p���@ r�j�DQ@,�V�*��@6=�G��	@?��Oy�u@ES_sL֪@Kw"w���@Qb����@TѨG(^N@X�/��շ@]����@`�J��@c7@Y2c�@e���9�6@hf1g��P@k,m2u��@n	��}y@p��B��@r��C�@s�CU�@ue��?�*@w!@��js@x�(k�B�@z�L�*��@|���!��@~��c�@�P`��1@�X4'(�@�g(_��@�|���#�@��r�@����j@��|j��,@��&ۤ5@�M����@���1>K@��u���@�.��� @�h��P�@���	�@��3�e�@�>�tm'@��*M��@��&Q���@�f�88�@�%�2
~"@����d@��FEA�@�x7?��l@�E�M��@��0�q�@��<�PIL@�����[8@���D�9�@�����M@�lw͖�8@�V��Un@�D��(�@�6��̩D@�A%�y�        ?�=�+{?K�9�v?m��W���?�͞�g�?�~��e�?�)����?�fW�yr�?���3D?����O[�?��;㿄U?� M�Y��?��Ą�?�A)�}E	?ґ��iE?�����?�4�IX��?��%�5�a?�mY~gP?��G�hi?��	Ψj
?��A%Z?�>��2<?�3h�"�+?��l%,!�?��5�x�?�f��Ȳ�?��Q�i?��G�+�?�J���f?��&2?���a�r�?���H�?��K�Er�@ d
�I�@p"�.�@��6�G(@�6��!@���a@��ɩa @G�C@Un��	a@	�@<��@
��Q�	@*d���@�O/�?@�S���@ 64Qv@���Q@�PC� �@L]o��@y���@�jt���@�]���@d�N(v�@3�2���@iJtp�@�K?#�@�}1�Җ@��	��@q�߳�@T%ݸ�<@9ȹm$1@"S^�9l        >��(�[?'�0���?K��\X�?b�[�O�C?s���Ո�?�ֽՂ�?��i�  h?�j#B���?��R*?X?��&vI?���*��O?�N��/U?���I�?�S[Ö�?��˫Wc�?��ѣr>�?���J]A?�ک)E�5?�ø��?�܂�)ϲ?ò��O<?Ŝ��GP?Ǜ�=�*�?ɯ�gS�?���ʦ^?�'7��\?�7��j?�m��mu?ұ8k�?�i>a�?�_�҆�?�̽X���?�IgG���?�֞�LƏ?�uW�<?�&�L���?������O?�a˵H,x?�X�=#?�ZG�Tv?�fƓ�jB?��6�A?壊E#1?��|��?�r\���?�]���O�?귄��(e?�Ŵ
h3?�V����?�����?�[����?�0L~j?��{:�?��.`�<E?���3��?�����?��i9#�?��k��?�$�-�?�7b���Z?�it�IC?����,8�?������        >���n�Ƨ?8N��lQ"?Z�b��?q��x��?���!&�?�=%ɜ�?��AӮ�`?�0��1AH?���$�?��D�a�?�[�@F�?�"��p?�=4�n��?�����o?�4ڻ"8'?üY�^?�k���?�BNf631?�@k��-�?�e��L��?�Y`_ 0�?��'mئ?��~O�l?�Ã`)�?عg�#D'?��N�8�s?��>�z�?�;Q"�U?ଧ��?��ƈ��?����?�R�-y�?��2?���1O�R?�Y�g,��?��PF�e�?�E��F�?��J�s�?�f ʻ>�?�w!nkJ?����V�?�Dy�]�?���(^?�zҖb?�]ͅ�?���},�?���m��?���}|�Z?���jH�?�Ʈ���?���"?�6(A�?�EH��Ê?�oKx�9?��ϼ��M@ �E�y"�@/�!9H@ݻX_k�@��ؗ�B@FFV��0@ �׮�@��/i�@��gp]        ?�{e�b4"?�T;،W8?��MX�z�@��Ə�#@�P{�h@��F�d@'yg[a��@0�0��:�@6R�V�@<�S���@B���@F*�hD�@Jp2�U��@O/k��׾@R%,#�v@T��w�@W�bT9�@Z�t�w�l@^u�-��@`��&<܅@b�n��M�@dlO���B@faZCVo�@hkp��&@j�y��,#@l�d�
�&@o+�N��@p�i���@q�T��@s/z#f<]@t}��~"�@u�U�k@w9���@x��R8�@z��'=@{�bsv�o@}!���@~�Lr��@�$���@��]r���@��:�d��@����o@�| S���@�[��KW@�@t=Ō@�(7:��@���	�@�8���B@�� ���@��^ ���@���o}�@@��I
�a@��t��K@�WҿT@�����@���ÿK@����?�@�-��Qg@��tĒ@�PdY!�t@��I���@�z�0O�@���9�        >����Y�o?
 >�r?/w5kca�?F���a&m?X3q\�rT?e��J)�?q0,
��]?y �R4��?�M��`p?��G/ƾ�?��N���?���;An�?������?�ڧ��?��)��?�đ��Ĩ?�nr����?�JM}�1?�Y�i�`S?���?oKp?��W��`�?�f��c�?�\�"{�`?�qv9MK?���B��H?������X?�i+Pe�?���4N5�?�W�/��y?����m?�>�S� ?��k����?�l6��8�?�vr�`'?���Z�*?̻� BW?Χ��rs2?�SzA3��?�]�.��?�p�P��&?Ӎ�<��?Ե!�ܳ�?���[?� �R���?�d��X��?ٲRbb�(?�	R��?�i��7?�ӂ7��?�F��\{p?�a���i?�%�/n�?��W�%l_?⺚��?��fû�?�d�H
<�?�AKCJ��?�#k���<?�
�
�>.?�����S?��V��?��x��,?��/����        >��0��>��s��>�������?�ܷ-g8?%�HE��?5#7�?A洛�'?L��P�?T���J_�?]Wsjf��?d��%z�?j���'�?qC� ��K?u��R<r�?{H��� ?��F~`'?�.�Ӓ*�?��S�i�?�`
k���?��b��?�+1��?�X��?�?������?�n|F�~�?�j���4?��4�aG�?����?�I���?���tE��?�E�ï/�?��<SfX?�~���?�Ȱ5?���d1M�?���8?Z?�v��޸?�~��s��?���K�n?��k˜�$?�.�p$�?�v�|?.�?��HW's?�A2�#�?��(��Bu?�\��?�	�L��"?�͐j��?̨�Mu?Λ�i�X?�T{���?�gP����?҈A륂�?ӷ����|?���G��?�D [ 5 ?ע��c��?�]����?ڔY�zk?�(�<ELO?��x�XU>?ߌ��Z?
?����?�'Ku��        >����
<�>�A�"��?�b=��?2��Q��?D�����?S!?_��Nᴁ?ht��,?q�d���G?yRy�-�B?�OV� <t?�/�6ӄ?�敠�y�?��bXQ?����!<?�/ފ�`�?��0��?�-a��d�?���\�?�j�����?�#I^�?����l*?��$چ�Y?���lS>�?�W�Yd�?�`Ъ���?�WK:�
�?�r6�'"�?Ʋ�\��?���'�?˨���?�a3sX&?С畖��?�)�"�?����_j�?�|27�?�I�M�3?�0��}?�1�Y�kC?�M�2!�?߆�C3�?��z��e�?�)$8$?�s�JE�?��#v�3�?�<b�Y?�Y:���?�M�F��?��
~��?�1ڳg�?�ݞ��?�3���j?�3RJ�|?�?P�T!?�W��v*�?�}c8��h?���Q}?��\���?�Cv9�?���F��j?�%�v?��|��H�?�(ѣ�        ?F�c��e?�=	���?�v�1�q?�*q+�qx?Ҵu�P?���O���?�Vi��D�?�9O��=�?�"�+��@�T�E�u@�N��
@�+gu{@:�^�@��*�=@�<ĖNq@^f�=m@!ZQ�zPF@#�ScC�@&����@)g
9���@,x笝6�@/��H� �@1��襲�@3u0)c�@5i�l=@7x�ܰ@9��f��6@;�qV��f@>S�Z���@@kĽҦ�@A�C_sd@C�+��@D�:���@F�w]^�@G�f�Q�@IGF�]�@J��G0�O@L�W�iy@N����n�@PD���"^@QC� f��@RL��]@S]�j53@Twuހj@U��!��@V�~$�@W���G�@Y6�f�^�@Z|8�jP@[�p�i$�@]!`u��@^�M���@_�.F�b@`��0+��@aj�y;��@b,�؇�@b��\ר@c� "5�W@d�۬�m8@ebUЀ �@f;�#QsA@g��G��@g��%?j        >����h'?,�S��G0?Qn�E�b?iI�X+�?{C�2m�z?�o�d淩?�_9�u�?�6U�K�?�V� ��t?�]��m
/?����K?��>$j\/?��49�?���=-?��])̹�?Ç�A��?�l'�*�?ɄFÖA?��֤V�?�'�\�M?�NF'��?��,_�4�?��[�//?�14��b?�v�#O��?���p�;?�TM| �_?��P��l?�P���d?��b#�?�/�,�
K?�4�?�I�� ��?��U�#��?��=Y&�?�d��Nh?�9����?���ҡ�3?����?��&ép?�{��iL?���s�+?���rc��?�>J��?�<�����?�~>YC�|?�����?� >>�b|?���Z|��?��A���@ /�Ђ��@ �ʻ��@��4�4@z�K�D=@G�04J@l�5 }@�hZ�<@ɻ�[��@�Ee93�@�߰���@qd���@	[�a��@
I�	˂        >��ƪ�k�?�̸�h?*�g���a?D{����}?V�n[��?e�e'?q�1q��?yy@�B 6?�ޭ9x�P?��K�v?����e�?���x*6?�F�����?�S����?��,�?��Խ��z?�zT��a�?�io��zX?�\�"5�c?���/���?�Ic=��4?�8ń�?��à?�b���H?��CY��?���
k?��ZQ[�?�W�'��?�uk*ѣh?�����W�?΢"η4?м�/��?�=\�u	�?�աaf*?Յ��s��?�N{�u?�0�oR{�?�-��Q?�F�C�?�|I�	�?��ߨZ	?�!'V�?�j����?���e���?�0���9�?�X�+��?�>�K1�?���#�]?�1��?�h�	�.?�%J���&?�!��Fq!?�)���Ox?�=m��.?�]��.?��9p��W?����B�Y?�4>[��?�`>��:�?�Ã/���?�5f	���?��J�V��?�F����        >�'����?MD=]�b?=�h+)��?U�MC�R?fFuwa��?s�H�V3Z?~}8�b�?������Y?�M�L�W�?��
%��?��D��Ҡ?����?�.�9�;?�<P�M$?������?�a��6y?��Ȕ��?�t}��?��ւT�$?��GV�5b?�N<_�?���D��?��GN���?�2ٿ[۳?���$(��?�D���W�?��!l�Α?ƨ�.!�?�{��NuG?�e�ÉP�?�gc��?΁yl�o�?�Zc?W�l?р����?Ҵ�Bk�?��r߻m�?�F �4?֣�.>]�?�ëG�?ٌ���=�?�q��?ܵ�kE?�dp�N�&?��h���?��� ��P?���ol�?����wL�?�B�^�i?�'�ն�?�Y�	LB?��k?����e;?�^���0�?��x�O?�m|�\8�?�&�U��?�c�Ўh�?�G\]��!?�3�S��?�)Q��`?�'P(���?�-��H�h?�=L+���        ?g*dP�>?��0xR�k?ƴLd��?��$���?���m&��?���D���@	Uʵ@�@nx���b@=�����@ �U�g@$�5xN@)��Ǣc@/VuS�>@@2�6܇@5��^\�*@9]���@=�.�lN@@��8@k+@B�����@D�|��M�@GY���F�@I��s��2@L�o��K�@OTL�];h@Q �q��@R�rA�'�@TA�"���@U��KT@W�)pS?@Yv!JA1@[V>ʘ�$@]H箋� @_N��	-�@`����@a�� �-�@b���{@dS�ʱ@eOƵ���@f��Y�&_@g���Q��@i='��h@j� ����@l\u�%@m�^R�q@o,2�8�@pdݒ�P�@q:{�۷$@r�:��1@r�݋9�`@s�Hln�@t���g_@uȞ9��@v�7P��A@wŘal}�@x̤�S�@y�=��D@z�A!�J@|�E���@}�@ܖ�@~@�״@e�	J�@�H�!�*@��X]��k        >�Ԇ,���?>��,�E�?d�P��*�?�u���?�|���?��/��?�Wn^ԗ?��O�/��?���	+3�?���)�͇?�~E+&�s?ʤ���.?�*N�u��?�GDyfo?֩OH?�P��8��?�=4~K#�?�7�i,Z�?�s�7��5?��N<e/?�T ��?��0f!�p?���7�H?�W��S�?�߂y��?�zD)W�i?�'�����?��ʼ,�P?���0�?��r��?��Y��?���m�q@ e2�Kߧ@��}�@���$/@�N52�^@�A� @R�4�>@����IV@��Jb%@
aM/��Q@�0���@N>�Qɤ@�*	7:@4�f�`O@գ_J@�ê"�@���PZ@�s`�@��I��V@p]��(�@e�I�=�@aX�`�@c����@l�6���@|�$jq+@�an���@�!kP@�@��D?�0@�ۯ��@ ��%o@ ��� F�@!X��OKp        >��n?��?>�K�{\?d�?`Hg?�ޏ�?�z@@�4�?��Cqo{?�(�?(��?�^ܴ�DP?�7���\!?�������?���>9tg?��- (~?�;�U�$?Ҋ^+�?ղ��h��?��{nw?ܸ����?�K'��WM?�X	NT-?�7��Q"?���gg�?�5T�ѹ�?��S>�?�dAw�?��j�D�?�
^��?�?��
u�?�&��e�`?�ϒ���?���4�>?�Y]Zt?�;Dn�ڴ?�1"iP�@ ����t@-4)Qr@GB�/��@l 8R@��n��@��P�v�@9�6ܣ@kmcd��@	ƁU厳@,f{\o�@��k�@L�T!+@���p\@�%��)@df(�@6���@*� �@ꞾQ%`@�LZ��@����}c@�P�5.=@�(Ɯ�@�%��OG@�|ge2�@�8.�l.@�n�^QY@�3r�S@���R@������@�{��J        >���}�@�>�'����'>�kU���(?���7?'�s�p�?6:�_�?BA���w?KN/k���?ST1�\^?Z#�T��?a��r��?e��;w(G?k�?�>�?p�(�6�?tz�QqZ?xV�"?|u�ҋ�?���a��?��A��#�?��7b8�?�9U2@r?�,�eM�`?�K��Z�?��R��`�?���CB�?���95��?���-�?�W�TKb?�i�ט��?���C�I?�4�ϖe?��q�|?���<d#?�#����?�����e?�����?������?�T�㞊�?��%=���?���z�P?�<`��0�?��{iY�?Æ�Q���?�]�5�;?�X�J!�?�y��p?��d�!?�6)���O?�knҡ2?��dB#�?�R]��s�?��9x��?֡K��{?�r��tH�?�b�U#�!?�rl��?ޢ�qm?�z�8B,`?ᶆ����?�'d?�g���<?��^��4#?�j�~>%        ?q���WD?�_2F}&�?ގ��G�b?�/'��b�@	�4�b�v@�Vk�9@"o��nP@*�
l��@2��~���@8gt��-@>������@C(Ą6(�@G07�sl~@K��7���@P+K��@R��$nϻ@UvȤ[�@Xa�6��@[z@�q�Q@^��jm��@as��s@b����=@dӤ[��@f���`�#@h�˝��@kD����@m^�����@o�:��E@q�o"�@ra��XZ@s�N�>@u�$�V@v�`_"�@w���Tu@y�U���@{��=H�@|�zD˂@~l���@���;}J@���D	br@�礂X�e@���^R�@����Y�@��8J>��@��K���@��&�BE@��/W7x@�6�'� @�anA��@��n��o@�Ͼ.�N@�}�m@�_��
�@�Zo�%e�@�	gC���@���E4��@�t�6�P�@�1�l��|@����[@���j�@�����<�@�S� �H�@�(KBm�        >�/9�?Ot���H?B�V��h?\4��� ?o,�v�&�?|��")l�?�F�I�p�?�e(p�#�?�u���p�?�m�_��o?�M�'�c?��s��?�� LtM!?�sE���?��D�\�S?�>��^?�Y��锤?���+M�?ń�:FR?�d����E?�y�m��5?����t�>?� �g ,p?����
�e?����ԯ?�>�r9�?�6��e[�?ۄ�Ȁ�_?��~ڞKi?�=q#�D?���?��x�K:P?�j��{,??��?MΉ?�!L�?�)��f��?��8c�v?짪��?�o�?�5�T�3?�3�N�S�?�;R�@��?�K�M�-?�e�}A�?��w�U�0?���4d6/?��m���?�.q��;?�y^K:�?��{�
X�?�-���S?��њ.@ '��>@ ���b�H@��N���@U[$�/�@%x���d@�8��m@֭[��@����@�����:@� �l��@to^{        >����F0>���I�4U?#%��z|�?=���ZM?P귿�w?_��^)�?j)�ayr�?s�\���?|�,|�?���~�z�?��u)f"1?�W-qQH?�eui!q�?��R#�y?�,R;��?��H�[?�gS$wi?�n)9D�?���!�Q?�C�5�ܐ?�����?���	�b?��"���~?�-8c�s?���x˽?�ej t�W?�C�*P?�(�!�ZL?��]H:_�?�i0�I8?�Q�c���?�?'k�̉?�H៳��?�o�MK?ε	�~�`?Ќ��\
�?���x �?�!u��@1?Ԅ�	�!?���#/R4?���Om�?���Z(?��>����?�:" �>?�O$�7�?�){��?�����k?��A��?�)���-�?�C|��+C?�h0K0?旊pb>�?��+�,J�?�J�
�?�j<����?��]� B?�3o�'i?$�V&?��:o!m?���!�6�?��� �?�+Y1Բ?�f�X�\\        >�1��,��>�����p#? �:<;?9��2��?MuΟ�?[�����?g��}��Z?r;����?zzp����?�Nq���n?�Y��-V�?�fK;o#?���>�,?�J��e>?�b��6N?���lXk�?��1�{?���J�?��+-��?��c.?��	��?�T�҂�?��
�\�?�{��Z�<?�SB:*</?�Zl��  ?�I���U?����m�?��f'�?ƽ>^�:�?��T��?���#�K�?�8�&��/?Ϣ�đ��?��t��?�pG铧?��Q���?�\���k?���N��?؛-��i�?�\oq�v�?�5�8��?�'��nx?����΄?�-Nj/� ?�N����?�m���?�4�?����t?�oT����?����A?�d�Ơ�y?���ʡ�?���Jd�?�b_ M��?��� ?�kPa�?� %�_?����0?����J�?�Ӡ�.6?�^�w�?�B��        ?S��@?�S�E��?��m���?��g�"?���M{?�)��l?�<_v��@��8�@��~�/@�*H�@�++��_@!����e@%«�@*Y�҇K#@/h�|$�@2y(r|�@5{��I=�@8�C��?@<=�\�S@?�T��oi@B�w_�@D#���,@Fg��;8@H�+B+@KV�~�@N��[=�@Pi!Ŋ��@Q��B��@Sn� z�@UQ�XvD@V�d���W@X�K���@ZY6P`�@\CS����@^@�9�m�@`(����
@a;ck�K.@bW�n�_@c~[��@d� � ��@e�@��9H@g/ܼt�@h�`؅q@i�j��~@k@�M��@l����@n-��%:W@o�H���@p��2�(@qsE,�Mp@rHXJ�"�@s#Y�}'�@t[9VH@t�oU��A@uاW�wy@v�aM�@w��Kx<@x���]E�@y�Sߘ%@z�K����@{��u1<�@}Bɂk@~'��^��        >�
�[US�>���|���?#m��r??�A�?f�?Rd�+�0�?ap]��[^?l�z���?u�A=��?~��E��"?�Z��2�c?�{R�;�?�@����q?���/�?��h���?���@[@�?�k���?�~y���z?�
/���O?��4��P?��}}��?����Tv?�e��?��X�"9?��:"��?��#ANq�?��	;ܲ?�x�ng�>?��+�B�?��z3�L�?����3)�?��}:0?�'���Η?�U~ig�?Ċ�"V�?�ǩ���?����5	?�Vxl,�?ɨb>֨A?�X&���?�az���?���0�r ?�8��.?�W�����?�+��?���Xګ�?ң0��$�?�o��gŎ?�A& �`?��VX?���q
�?��q�8St?׵�8�p?؟Iw2�?ٍ�"�=?ڀ��v��?�y4��&&?�v�Q)�n?�x�A��?ހB �v6?ߌ�Ԟ�*?�O'MG�?��|,,�p?�h\��G        >�躂m��?�dJÁy?9f�%-��?T3Q��2?f���x�*?up8pN�?���|�>�?��῟�?�._�?��=cz��?��tE#z+?�5�5z�?�"tS�?�1��S�X?�`�)���?��OPK�4?��5[?��a@��?��i��?�x��42�?�_]�G��?�Qb�Ķ�?�NRЉ�R?�U�3��8?�h-{áG?��z@ʍ�?��36Ԑ?��b3s�?�?=JP�?�3��<\?�^uUSq�?ǐ�d��?����
�?�e�S?�Z�T�ҙ?̲2�[ē?��~���?φ�לX�?ЃLfmx?�KH��?�3j��?�������?��\(BK?��[-��?��T87�?���� �?��f��|�?�g��?�?���?ۂ�ž��?���{h�?�>h2,1?߷�1o^?�k'��?�sT��?�O&+�mX?�6p%�;�?�)Ų�<?�)�����?�6����?�Rrz+�?�{� %~?�r�`��        >�? o�t�>�`�a���>�WW��>�����83?{pe��? �G�5K?,��~��?67=/[*?@o8-?F���A�?M.�.XT ?R�^tV:?W���gC�?]Ze���o?a�t>,ͯ?e�s�H�?j;#��^?o]�O?r��K��s?v�A�?z�٫6Q?~��5a��?���q�9?��%8��?�]�~�9?�H�����?�^dj�9?���+sW�?��ռ�.�?��4}��?��w��?�S�$��C?��'����?�$P)?\?����>>C?�z*��?���2Z?�<�q1��?�_Nybp?�����w
?�S�@n?�-�9�b�?�O�@hA�?�ߘ|Nr�?���v�	?�Ρ��?�q�S��?�}���r�?�& �۝u?�	1E�9�?�� @�/?��(��I<?Ԟb@��Q?֚��,*�?ؿP�A?�i�L��?݋!��;�?��'���?��٥|�?��v���?佧�Q:j?悹���;?�gXv�        ?3�$iS~�?{(R. p?�텼� �?�!�JUt#?ҨE���?��s��?�ĸ��.?�pB���?��m)��@�$�k~@�ѥ��@�4���@�-$*�@��/��@x7iY�@Xs��m@ ��Lk
I@"�&�V1�@%��"�@'|��쫖@)�uKh"@,��̗Y�@/8��i^@1 }Iڰ@2p���@3��g�^�@5s��0�@7!����@8��RE|@:G��1�@;��n��@=��<Ie�@?q��rz @@��(%��@A���ʼ@BrO���@Cb���@DUs���@ELaY���@FF�����@GEw�pe@HG�A8?C@INˣ�O�@JZ!8��@Kj<g��@LW��۳@M��]w�?@N�he�z�@O޹!��@P����.@QKO8'l@Q����F%@RV��:@R�F6��~@S��G�7@TC�[v�@T��XH�@U�		`]�@VKÕ?6@V�����@W��+
@Xl;�W�@Y'��9U�        >�������>��Ȍ�?#׹��<?>i�cƓ?Q�Py&�?_��G��?i�����?s,x�ϲ?z��Q�v?��W���?�5��}�8?�!Łj�P?��L�(?���Zy:?��%Ո��?�ک~��p?�D���?��9�z ?�v��5��?�P0&�^@?�S���a�?�����?�no�R2�?�3'�&�?�A��.?��@�e�?��ޏ��?�DO�6�?��5d~�?��olS! ?�;��q�?�]��7?��r��)w?�a��	G�?��%�.W?�y�2�?�-��?��V-fb�?͡�.��B?��{?з�#ȫ?ѹ�<K2�?��a��C�?��c���"?���Z�Z?�&�����?�]���?؞Iт.�?��ۈ��h?�B��܂�?ܦ�j Ri?��iV{J?ߒ��&�?��u�@��?�W݉�yH?�(�x�Mx?��؍��?�ݡ4��?����-�?�Y4YGM?柈ydI?���7�?�8����        >�&[��}>�(o;�@�?�5���?0����?Dӯ5B�?Ua��K�?c8�*��?n�eL�̐?wT	��ٸ?��p�`J�?�����A?��]I�қ?�̄�{�?�����?����6��?�e�x+j�?��JD/��?�)[+?����V?�A"U?�	k.�i?�a�H��?��8|�x�?��%����?�o_k�z?�~�	�w�?�`O�d*K?��q��&?��_Y捂?��$�a�8?��ҫ��g?�0�c�?͆�PFV?� V�+?�O޶�V�?Ҳr�
�?�(�һ�^?ղ�S@�:?�R{D?�����I?��N�o!Y?ܳ"s?ެ�b��$?�_�Q�:�?�v�"\�_?���Ke�?�͖`�B�?�M���?�`�~��z?�����?�5qX�o8?�#��sL?�QXa�c�?����.�?�<�}M�?�ƻS H�?�#�-��?�©u*�?���q��?��b�>5?�L2��$?�2=1��B?�p���K�        >�.R~*tf>�sMk�?�[a0�?#;:�s�?72gv�X�?GD��=��?Tr5�U>w?`R-b��?h@A�o?q�n7?wX}+K�?~@�$X4?�#8���?��fP;��?�FS�N/?��_rA�?�4s�_�?�$G�8�'?���b`pl?�DD�:��?�
{X*�?�!�z�*v?���x�ͳ?�Z�e'6�?�DW�l�?���:Hv�?�i$��?�ҁ��<?��AYP4�?�?�Z�=?�PZ�xM@?�>>膍�?�V���I�?ǝ��k�?������?����}/�?ϧ8��?�c@ ���?�� W+I?����%K?��r	k�N?����?�"�8���?݅~���f?���N@?�e����?��V/�o?�cȶ+�?�����?��&I�>�?飂.;��?��f�e$?���O��?��3tw�n?� D.Eo�?�]	���?��u��?���Л"?������?��X\��?����`Ł?�V��?��?��@d��        ?1Ow���k?q�+�+�?�3�]�|�?��ާ>?��l��?�3Mn��?ݎ!��6D?�����?���0x??����?�u|_��3@ ����@K�H�N(@d"��(�@�,��Ɏ@��6���@p͆&��@7!����@)0{�@D���o@���#%@!z��+�@#E�(��@%&Hw��@'��@)-�J�B@+V�s`^@-��,�(@/�R\l@19
Z��~@2�d���p@3ރ�O�`@5G��g@6��f�Iw@8I�(4��@9�lzWV@;��	S	@=Iɢ�a�@?AZ�6�@@{U�֌�@At/CG[@Bv[��Y?@C��@o�@D���v�s@E����@F�����@H�'�0�@IS;�vd�@J�����@K��г4�@MPna���@N�9魠@P�y~��@Pٽm#t�@Q��Z�8@Rm�3X*h@S@�4��@TGŨ�@T��RFm�@U��9!�E@V̥���T@W�/�"�@X���b�        >�c�W�4p?�Z�o�?7��M��?Q����?c���o�u?q�K<ݡ?|���G?�t{S0��?��!�S�?��S��C?��}P@��?�kt��?����怲?��}OF�I?� �O=�?�p@�X�-?�
�[��?��i<��Y?��8a��A?�+}
�?��e��?�����?Õ���i�?Ũԉ��/?��Yi^*#?�-�T���?̡�wG�?�7-���?���f��?�e�XZ�?�����l?�x�[{�a?���>�?��ߵ*?ڡywa*�?܀^]�?�r+�(s�?�;�r���?�HU����?�^��4N?�~\�$��?�Ɖ��!?�ګ���z?��Z�&@?�\�n��?�X��|=?�l  ?�d�k��h?�ϑ�&��?�C�IR�)?�`��M�?�$ۭI��?��Ԏ��?��W9�X?�K��?�g�]D�8?�F.��Z?�)����s?���G��?��lKh?��G�J8�?��*y?������        >���ũ	�>�R3��G?l���in?,��f��?@���CN�?P<�Wj�?[S�S#��?d��ѫln?n�!8X�?t�1�WP�?{ö2�w?�M|tg	`?�������?����mF&?�OZޮ�?�(A��d?���my_?���֕g
?��v��V`?���s�F?�f)�/�C?�E��t�?�i�y�b�?��^��?�ȕ����?����?��T)t&y?�[k;& ?��4���?��k�?������?�_y`kK�?�Ԏ�-�?���֋�<?���g��f?�؉BF$�?��-�?�[M��(�?����g@�?�9�Hn��?Ҟe'���?��Y?թa��-�?�Q��XW�?�m�UY?��ݘR �?��o���e?��U���<?��g��V�?�g��??���v2�_?�<�=nz ?�{�1��?���}�/?�&���?�(h��?���oU��?튯Rv��?�eF�ϖ?�e����?�!T��I?��YI�f:?��+�t�        >�D�ܹ�6?�3�A��?7"�	?�?OV�	��?_ϡ�9j#?k�d�?tq�{[��?|�rb*�?���U�U�?������?�O��{5�?��%����?��5�y?��}�n�{?�t0��Y�?� �q��?���NC�?��U~BR?��l4/�?���Y ?�B:䧈?�����?�M��8�;?������?�mS��b??��N��%�?�|�j1
�?�"�ࢠZ?���R��8?��e��!i?���9��?��u�d?�e�p?��`���?·%��c?��>oE�?�M{G��(?Ƶ	y��A?�1*�<?��7o�t<?�l��Q?�.��1?��U��e?Ђ#����?эS��?Ҩ���?��eIE�?���M?�\c�%�T?׻��4�?�-�Z�Dd?ڲ�;@�?�K3n��Z?���?߹�{�F�?���]�Y4?�� �??����C�?��_�X?���Z?�H���?�O�Gf�?�r%IK        ?Wo^�^�?���9 i?��G/�R�?�EiO�u?�h�w�(Z?�ցI>?�{���@̲�@e�����@�	g��@Q�a�4�@"���i@t�V-�@"$����3@%Q:˘��@(�?#@]�@,r�,��"@04|x�E�@2Q�H\B@4��!j
�@6�݁���@9{&�"��@<%`�A}@>�;��:@@�>_˥�@B�z�ő2@D";(���@E���QL�@G��:9~@I}�W�{%@KpN uc^@Mx[*���@O����@P�|`{Q@R	Kعw�@S8�ɖ
@Tsw1D��@U��W���@W	#���@Xc���cw@Y�Mw�@[8Zy��@\�p��'�@^4�JH�@_��n�W@`�� k-�@ay��8.�@bM���p@c%II��(@d*�|S@d����@eʍ(Hښ@f�Wq-7@g�a/v�p@h���	��@i���R�J@j�0�7@k�XŎOB@l�?����@m��Lg��@nڠ�%�@o�J�s�@p����        ?%�ۧ�?[ű��2[?}�<K��?��z�>>?���/�?����?��?�$)����?��S_;<6?Ǚ���?�A8�?�ΰt%v�?���t��A?�-ޢu�?��OFÜ?�iOX��X?���` !?��<�Ab?�ȒPF?������?��gw9L?�;3�XZ?���?�΃Ty��?��-�ol�?��ӗ=�?��.z;?���](H�?����1��@��dG�@1�_̓@[���@���F~@ǬnX�@��L��@Q��7B@	��z�	@
��AN�]@X�(4�@��A��@.	l�PN@Q�J]�|@��-@�Ŕ�@�-g �@c�npy@0��`�@ԩ\�@ֹ��@�A/3�9@�e�P"(@k#�<o@Ny�^Bj@5g�бa@�skis@�.
	@��Q�@�Y��@U�O@�`��<s@ v ^�@ �3�*@!|N��9@"U9��        >�`2J�ʄ>�B`h?l��Z?'~.c�?6��e�L?CPu��?M?x��-?TD�����?Z��}�?a�f^�?e ҕ(҄?i�<�[�?nV�!x�h?qÄ�o,�?t�v��F?w�o��1?z�b$
%?~m�H�E6?�#���E?�:�El#?���� y?��0��c,?���1�19?���z�G?�j�|��?�,aH��?��;;�?�1#��(K?�|�ǣt�?���`!D�?���_q+G?�]d��7�?��e�$�.?����<�?���|��u?��΍.�j?���2	�?���	��?�B�o��?��mB'/?���(-?�Q�~V4?� D�bR�?��ϡ�?�$o�BЖ?�]L�.f?����5?��D:,�j?����l3?�iwb�׮?��W6��?Ɗi���?�>pU��?�.�5��?��k@W|9?����I�W?��9��?�"�,�
�?�L�3���?ӆ�e�?�Ψ�X�e?�':�"�?אQn�j1        ?u:��?T�Ʋ"�?wu�6�y�?�W�{<��?�0e�?�Q��e>+?��0� �?�<���u�?ǋr�?��@�(|o?�o����?��ͭѤT?��n{k�?��N z�?���l,$�?���#7�?�%����]?�'���?��:E�?�i�Q?��f9=D?��OB	H�?���G|%�?�4��]�?��p4~'@ ��0��@g�6�(�@�8�wʵ@6�w���@�"U3�@@Y@x8@��=*x4@
�	-x@BJ��t�@
$�@�XUH@�Oc~�@����@���_��@�L��@!�?�j�@E�c��@s��@�����{@��X�u@6�q��@�D�3q�@���ۂ@R�n� @ co)/c@!!��DT@!�!/���@"��k:��@#~�O��@$S��@!�@%-�i��@&���@&������@'��j��@(Ѫ���b@)ɏӌ�D@*ǘ�QO�@+���        ?��ަ��A?�!*���?���7��@{?�g@Y�}�o@(��J#�@2��]��@:�b�ä@A�'D�{i@Fꇒ�E@@Lz,ֳ�@QD ��
@T�����@X�wl��@[���)��@_�X)��@a�#����@d�q��J@fWfX@h�q�a L@k,u�l��@m��C���@p1M7�M@q�t���c@r��^%@tq���@u�0�Y��@w~T���I@y]+��@z�/��9�@|c��T3g@~�\g��@��5`� @�Ա#1d�@��Q�(��@��N@wFe@�����N�@��T~$\Y@��Rܱ�f@���w�~-@���VoT@�Ư_k�F@��iRd�!@��.z?�=@��o�ئ@�;�$�[�@�e<���9@�����8�@�ctöI6@��t�n{�@���Ƈ�@�>�X22@��BcĞ@���][�@�.�� �@��Ԫ��-@��=IE��@�3�L�{8@��t(K�@��v7�R�@�N1���@�?��J�@�����q�        >����ќ?6��S��?Z蜐��?s���I(�?�K�}�!�?�9S�=\?���ˈ�K?�~�D}�#?���a�i�?�`0G'<�?�ݤ=�;<?�����?�M�ng�?�����-?��=J��?����*w?Ѳ�İT1?�o���?և�gX�@?�$�ܧ�F?���˱�?�;'?����?�r��X?�Kv��B?�Ɠ8�RS?牔��N?�]c��?�?�BZ1v�?�7�=�n?�>e� A?�#dM?�w�/U?��g��F�?���#q?�/�L0?�e�6W0�?��od��/?����?�9�W��?���e׼?�����x?�R��͉?�����fB@ ��WB^'@V�-Sˊ@�q.q�@�t�*Z�@����`@l�o¼@:Z{|@
ˮ��@�7��s'@����a�@��J�R�@	i�|8��@
H��m�@*0W�k@a/�||@�,�M�@ޅl,�h@�])���@��(V��        >�t�Z+>��!S,�?e��L�l?"-t�%�m?4��hu�?C2�;�?O�v��Yc?W���p��?`�M⩘�?f���?m��J�@?s��f-<?w�� �?|����8?�l���I?��v����?�c�+֐�?�q���x�?�t�O��:?��h�ގ�?��ƾ_�!?��3/U?���hwF?�G2cX@?���ǫ;�?������?����<te?�RB.��?��_?�/�?�Ӕ`��?�u6T9��?��OA�?���^ϻ?��j0��[?�����?�*T�uF�?���˵��?�"���?��J�>?�k��T�?��@��N?Ů��^�j?�|Uט�?�h��KY�?�u7���<?ͣ����?����aY?�5��ú#?҃���]?��*��1u?�[|~8-?��l��b?؆��-��?�>dX��?��~A�?���P�6�?���O���?�/�z�c?�}�Ȗ�?�EA���?�y�/���?弬�$�?�7H8        ?����?=L�J#<�?aԎ8C$?x����?���@�
?���z��?��qV�A?��l&�j ?����x7!?���Ǚ��?����|,?��S���m?ơ2ߏ�?ʥLbfM?��7`ڬ?Ѻ���?�X8�
�?֠�a5��?�A�5C9'?���0+�X?�ی�,q<?��"��;�?�t���A?�]����?�Q�ř?�l�y�X�?�2��'H?�&�r��?��*GS�?���=��@?�qU�{?K?�{y�s,�?���~?�w`�H�?����?���>_W?�2�ӹ��?�t=�/>?���uM�?�L��p�?�w˵��?����]ߊ?�]���`O@ qt���i@:e2~�i@	ܘ�	G@�%X�@�!�L@�O�Gb@��ι<?@�
�|`@zT�˔�@|�k�@	�]�{OY@
�,�t@�k��? @�I��j�@�p��@;����R@= ���@@��y�@���Q��@7(�j�-        ?u�J�X�?�T�t��]?ґHU��?�xI�RL?�Tz̢@
o�m���@�{_� @����w@%)���@+��q8�D@1���O�@5�f}}�@:c|��@>׋�l�@A���j�@D� =�<�@G��t?��@J��9��@M�-����@P�=.Q�@Ri»���@TA��q�G@V-��'�@X,���Kk@Z?K
��@\e��c9@^�R�@`u/ͤ@a���/p@b�dX�[�@d!s��OX@en"��R@f�i��<@h$<�5S@i���O8?@k /���;@l|���@n �܏`0@o�ƕଟ@p���2�@qa�4�MX@r5p�7��@s�J�@s���<h@t��ė&@u��ViS�@v��O�`@wyk�\��@xf[u��@yV�lW�@zI�&޹@{@r}E�w@|9�r;�i@}6s��@~5�Еki@7��*�R@�gQ>@��&��C�@�'-k$��@��q����@�4��}Z|@���X[I8@�GG�mi�        >�z 2>�?![ޤ�<?D�8��?^�b�"-?q B����?n�g�s?�t�'�6?��О�MV?�Q�#�P�?�z��G?�b�l �?�����B�?��qZ�^�?�AB9q�?�Ի�Q�U?��]�~�g?����1>�?�L�+è?�nY��l?�����G?ɀ5�:�?�=��l?��&8}�?��#`.�?Ңw/+�?�F�#P�V?��I�v�?�Ś%�6L?٠L��?ی� I�?݌N���Q?ߞr�RP�?��ŤC4T?��掮�?�#��Qp?�SQ�m1�?���@�W?��ZSl��?��/�?�u�Q��??��"�y8:?�D�1�m�?����3�?�=�A#�
?�e2��Հ?�0غpJ?���R�?��p��h�?�y4�a?���3i�?�}_��^�?�j�h��?�]�fӒ?�V�<4["?�V��0?�[i����?�f����?�xB����?���)"��?���N��@?�ѱ�m��@ }����9@J�(��        >d[�+�a@>�����$>���_!�>���V7��?��<?m��O�j?�G�Rf ?%����~�?/d�߭�!?5�U���[?=�\L�D?B�:P��?H*bm�?Nv��0i?R�H�~�?V�-�U<'?[m�r���?`v���w�?c�N�I�?gIL}a�?ky�4�~?p!���f�?rܣl�71?u�yC�S�?y|3�C��?}u�p\�?����Y)?�zqxjf?�Iվ��\?�l��a?��[�x�?�dOTh1�?���zi�
?��%p�3�?���J��o?�]��j?��5K9U�?�xB�t�F?�Xz�9?�d
0��-?���H�`?��>�^r?���C�p?��
�B�?��m���?�q�LɈ?�;X�i�?�'i�t��?�8���^?�p��	.?��zY�G�?�]H�=%?�"�Y?�[&�U?�����?ų���d?�v+S�
?�U�o�97?�Sqj?�pjʲ)�?ϮI�P��?�C����?�IS�<?�        >�1+��=?���?@Ѯ��iL?X��I.��?j�D�&A?xQ<	j��?��-|0��?��bqjx�?���;�Yg?�3�r�`?����!$?��+O�A`?� �� $?���z!s�?�lMUJ��?�*1Y�^z?���?�F?�5���(p?��w�zS?���r�?�Xk�V�?�H��h��?�Q�?�TQ?�tS~��?ʰ�ǖ��?�=$��?�x�Ԋ��?��W�<�?�W�1"��?ӻ�Re?�-�7�`?֯\h���?�A#�XGG?��I��"?ۖDn�?�Z����V?�0���ĉ?���-��?�d�?�h�1�?㢴+�?�Mŗ�p?���Q�W?���7�?�R:k4�?�l;#/�?���NY?�OzNP��?��4,g,�?�8_b�C?�`��#@?�,��ߑ�?� ��Cf$?�܃@�_?����]�?����E?���٭��?��X˅?�� c���?���<
��?�ύy�4.?�����?� �C�	        ?\m���Ω?��dϋ;�?��Ɠyf?�Eܹq�?�Uu�2?�Z�>{ƫ?���Al�@��(J�@[(��}8@9��(�@������@е�R_k@#Mb�R@&���F�@*��g`�@/D:�"�@1�X�8Q@4Y^�F��@6����"@9��p��@<~6BU7@?}x�x�@AP�� �@B�a|I��@D�f��2/@Fr�V�y2@HM8�_��@J:GƘm"@L:�y�`@NL�-�D�@P97p*5@QU�F�5�@R|P��_@S��� �E@T�pΛ��@V,ZC�I�@W{��?��@X�wu�7+@Z9��1[@[������@]"���!@^�|��J�@`�Ц�@`�Ѯ�	�@a��"E�O@b��jT~q@cq扷&@dUu�]�@e>�IS�9@f-����~@g"��~��@hp.c9@i�0wp�@j%�</��@k3�7x�5@lG]���@mau����@n��t�%�@o�q�(�_@pj�WK@qV�?��@q�*��@rA2+��        >ߩ���?ׯP	�?@2�5Ĥ?W��# �?h��ăMi?u�L�8�?�wA�X ?�ҠZ���?��[��_�?�1LI�p?�X-2;?�GYQQ;�?�Ӵ�ъF?����rg?�ˋ$Z_O?�����m`?��|�;?�j�'�?��Ύ>q?��%�0�L?���Gߩ?�R�<��?���T/�?Æ�#�L�?�:m4�F�?��t���?�մ\��d?ʽ4����?̵��{~K?��o�`B?�m�#[�*?у��J��?ң�B<d?��Ï�S�?��QR+Δ?�4�=$R	?�w$��"?��}�u?�F���?�u8���?�܈B�F?�M@GN�?��a��j?�o ߚM?�kΛ&�?�6�]Y9?���6 ?����F��?��E�|[?卦�?�Z?�mLj���?�Pl��A?�6��k�^?�����I?���@�?��f{=��?��2�Ϻ�?��7��~�?��[��?�ʉ��t�?�ì���V?�_Xo�T?�ݾ�Y#�        >���_�gR>��r�l��>�<�����?	[�?S≛�?"BK��i�?.��`�h�?7�+,�0�?ADe���?H(���i�?P`�q��1?U��	��?\ ןANF?a��0���?f��a5>�?lUe�,v?q��\S7E?u�LÕ�?z<�,�'�?��x� �?�e���?��oX!}g?�!{��;?�]���?����C}�?���y�%?����v��?���[JЬ?�4V��zx?��*�
�?����s}D?��|���?����!1�?����"�}?�����?�h��՚�?�t򪦿?���E��?�[l �?����+?��	a�'?���Δw?�|o��Q|?�>�)�?����[\i?����4b?Ѯ�*�h?ӃJ%�6?Հg��o�?ר�}(�?���'6��?܅�Ę?�@���^?�#�r�?��3���?�cD 4w�?�8��9B?�.��~�"?�J,�O>�?싫h~X�?����rt8?��C$�?�&K@Pc=        >�YsJ�2?��yx��?9�}b���?R�2�3�?c�$>�^b?q�;�<t{?{��A`}�?�%��t��?��z�j�?���aT�?�ݠ7�D�?�4��-�?�4Fu�?�8x�07�?���h��?�bA�6?�]�,�}�?���~�?����?���TLM?��p�(?��S���?���eLR?��xSAZP?�g=z?�MQ����?�% �1�^?�@�j�?�'�cܤ?�T�6I��?Ο�L<�?Ѕy��F?��Z��?�":_��p?Ԋ�|��?�de�?�?ג�dv�?�3���3�?��ܰ���?ܲ�>Փ�?ޑ���U?�CdA�?�IT
�w�?�[$�%%?�x��Z?�NS�1e?�ڼ0��?��*�@?�rZ���?��n���.?�CL�]?�?��gڌT�?�Q4�L�?��!�A8?��Ŷ���?��H �?�rDK1?�x�m_?�4lĕ�?��h���?��.-s�?�����?���[�<g        ?Ql�2��'?�0�J��?��:>��?�lL*4�a?��x�5F?�ӱ�ay?��"Z��?�p]�BPX@�)q_@j��!�@��;�'�@�����@�|���J@�=���@)Tsn@!�1ؓ��@$X�d7p:@&��k��@)�m��u&@,p�b+@/`r�3��@17��@�@2Λr���@4t�w�@6)�A�SZ@7�}��@9�=#�K@;�2}��@=�Q�!�X@?����k�@@�n`66�@A�Z�@B�J�M��@DV�|@E@NN��@Fn2��@G��v�׎@H��{YD@J&��Z@Kr��[c�@LǽW|��@N$aЊW�@O��Vea�@Pz�C�@Q4�܇��@Q�2�~k@R��r��;@SxoxK�@T@�e�0@U/��m*@UڢDeI@V��%!9h@Wi H��@XU?�bC@Y-�4Q�@ZЎuǧ@Z�C�=*�@[�\��@@\�
�c"@]~@PZ��@^_�����@_CNFC-@`�(�J'        ?�~�{ř?A���e�+?diT�T?|�d����?���"a�?�S2�0G?����Ȅ�?�J>`��v?�j�82O6?�s��+l?��g��cl?��kMP�*?ʕQ�Ͷ�?Ϟ'~%'?҉�u�U<?�{g�4/?أ��A&?��Al�L?ߙ�u�?�f��{?�4�`�?��C,5.?�� �A?�i��z�?���	Ȅ�?�tk
�I?�\_d�?�|�;�)?��T�P�*?�|H����?�{!n?���fmX�?�r�G�Z:?�:*=�P�?�8Ɇj�?�����@ �WJR[d@��+��l@~y�l]@L���@2�Αt�@UG�i@l��,�@�R:�B@	���}��@,^A��l@u���@�yĐJ�@9� �/@?�J긄@�#�]�@�U�R@h��ޖ@(����@�����t@�N7eq@����@R}�'��@'s���@ ����&@�{ם۹@��3�h�@�����        >�No���?�0���?/.�^��?H��W�y[?\>����?j[����m?u���v�?��d��-?�T�}�-�?����`��?��V!N�?�m+��[r?�i����?�����
?���}�[?��,��?�~��}�q?�/��-�.?�oN�:?�0�W_H,?�u\!*2�?��ɽ�q�?�x�G�?�<�ҙ�l?�r����?���e��?�ZP�?S]?�$��~&�?�#*	
(?�(֔I?�;;�h[?̓�i��?��5��;?�>�3q@?ҙf�&1v?��J?l�?Պ9D0��?�"rڏ'?��4����?ڗ�V,�y?�v�[�s�?�o�N��?�A����?�Z@��?��/?㷜�	_�?��[���J?�V Y���?�?��wH?�:Ϸno�?��dڛ|?�k��b?�"ks� �?��?���?���_��?�����{�?��:�?��'��D�?���k?�K7ֲԋ?��UL�?�ʉ��&�?�6��*        ?bV{�@?>]�����?a�����?yKm���t?�x�~�?�+�w�?�"吋i?��lj+-�?���cq�U?�����j?�Y�}�~�?�I��G�]?�<���	0?˅ya�k?�]��Y?ҍﰋ?�6i�3?��c��?�,��?�J�f��?��k>?���?��&�?期L\�?����S��?�o�2�?�h�:�?����
�y?�IP}^C%?�F@��?�#�^��J?����I?�G'�z?����FZ�?���;A�?��tV?�?�y���@ =T��@H� g'�@_p@���1OO@�'�1pL@��"��@2Y� �6@��,��@	�fd��@Y$ʑ��@׀ɀݛ@d��-��@ V�W�<@�!W&�b@��"4��@��!w�@���@�@~sV�@}�Ɋ.@�!�M3@����Ԥ@�n*i��@���K@)��#:@=�E�t�@�9��z        ?�v�XA��?���N�B?�d��,�?���y���@VA���@�����@ t�'냸@'�_���@0a:A�=�@5u�FZ�h@;0"َ3@@��$U�o@DF�����@HO�ف@L;D�:(@PXsx�@R����;L@UH�/
�@W����!@Z�G�tR@]�6;�@`�b�p�@b?xz��@dg�bX@e�yǀ+�@g��� >@i�9��@k��_Oy@n470��@pA����@qs�;�/6@r�� Ŝ�@s�V��s�@uPas}K@v��ys@x� �_�@y���%��@{�I/��@|�#V��@~;��P�@���G��@�Ƶ@�Ő@��h�  �@���0l��@�m?�
�@�Zb�?B�@�M��0;@�Ep�h1@�B��<\�@�E�X�Y�@�N{8*��@�\��J��@�pu�ڿ@�����r�@�����jg@���ʈ�@��oM/��@��}�H֩@�/�-՟D@��I/P@�o��zD@�!M��m@�����k0        >�i�0�D�?Td�?-�����B?Hr�*C�?\��p
��?k3��*�[?v�_b1ؖ?�
!�3�?���_�d?�	vK�?��G�Yw?���;?�6��$��?�����?��mO��^?�p@��h�?�:�!���?���ۜ/?��F�Y�c?�z`��?���$�ev?��F�q�?���C �?��K_��?�Qr@�?�����	?�z�&T#�?�&�z�,?��{M�T�?ɭEy!;?ˇ	�j�P?�o���]�?�f��l��?ж~1n_K?������?��bT�@�?��=�OYz?�Y����?�2��`�?�a5�&w�?ؖ��F�}?�ӟ5��_?�l��?�b?�VO?ݴY���?��|}�?�6��H��?��+(��?��Af�?�\�n�u?�����?�޼�I?���l�?�q���-V?�A�V?�?�̋&�E?��x��?��\��Á?�MdpD�?꜂r%B?����?��L?�x��_��        >̝�x4��?��o�?>��)��W?X�`��qx?l�h6P?{/u���f?�L2��J?�����?�"�w��D?��2ـ�W?�a e?�ݴ���O?����H�?�����a?��$Q�?���l��B?��/�P?��vP��?����WĤ?og&�M?ģ�	[?�ןn*�?�*��	�R?˜��)�b?�.H���?�oR��]?����j?�M��� ?��}���?�j�=���?�`�G�d?��*t�_�?ی<�i�
?�b�[?9?�J���?���&Z?ᧃ3:��?�>���,?��b��(?��,�n�z?������?�Q� ��?�A*�$?�ݫ
�|?�4|k�4�?�8B���?�n
�'z?LƜy?��Ws��i?�R{�VX�?�&��6Q?�|HI�?����K��?���dR��?��S�Y�&?��Ϙ�۲?�Ɋ�4VK?���^��?���ӡ��?���e�?�F���e?���n�H?��D-�Q�        >�i��i/>�QA�C��>����u�X?1=��}?!���PA|?0޿��6�?<Q�K<�?E��|�?N����r?U�Q���?[����J�?a��K��?e� 8պ?j�AU�:�?pJ���	?s{J=mlD?w�i?{#\��΂?�}�Ƈ�?�h!�B��?�E󉓱:?�{N��a?���mI�?�@���?�B��Bp?��o���?�~���?����i�?�樓%Q]?��L.��?��$x:m?�1�m���?���9l m?�|]�.?���\p�W?�q�-�?�G%_V?�J>�ҕ_?�}�W�i?��k�Պ?��錁8>?�d���?��_�?�vw�zc?�P�MI��?�T[���?ȃ/OE�?��($�d�?�m����]?�&�.�?ё���?�(�'��?����9X?֭�K�\�?؟O�!,�?ڱ��]}?���σ?�>B����?���r�h?�0��?㖏�@�m?�4����?�𸼒}        ?=���J%:?��;��d�?���R��?�~$����?�gGy5�?��C��&?�jy�<@p@ _l���@{G����@�>G�	@\f@�@��W���@i���z@ �/B�+;@#��_@&���W�@)�,�g/�@-a��dv�@0��X��@2rQ��@4{efM{j@6��k��I@8�3��A�@;6a�jr�@=�W;}��@@7�V�@Ah&�| �@B�h:�'�@D)�]���@E�n=��y@G���.@H�h�YJ@J+L����@K�[(q�F@Mi�%m�D@OП�V�@Ph��@QIN^�mq@R/��s�@S�}p"@T
�ɍ@U �$�@U� ��@V���}@W��ƚL�@Ys�0|I@Z h�@[%���@\=i�|��@]ZE����@^|kƻh�@_�����@`h��dQ�@am@b@a����2�@b>'���x@b��X��4@c��o�gT@d0VDo��@d�+{��@e�����Y@fAf0P��@f����W        ?��[�0l?S��+���?v����K?�}w�?��z	��?���@E?��
ɶ�?��_�71?ª��Ga?��D2X?�-*�i�?�MB��w?��H�	k?ٿ�,��?��MsЪ?�%�\�?�{gI�&?����M?�
8B%�?�=��W�?�2>�c�?��q���?�
����?�v�ʏ�?�F��Q��?��	�&A?��]����?��tW�?�g��dP?�Q�Vk@ $cچ@%��W�M@.&��P~@<h���@P����@jѠ��R@��rz@���)�`@�[�@
����F@E*�h�@�S
X��@�Rz�r@%��@.a$1?@؋���@���&��@5;j��@����@��h��@Tn~��@�^�@�[,CQ@��_�_�@I�HyȊ@��a��@ѡ���@����#�@a�? �D@,o_:J�@�#�hz�@Ǧ���@�����        >�w��+GU?<��wb?`{��P�?v~c�*Q?�v���?��J����?���Ŭ�c?��gй?��Z��?����-N?��)���?��j��K?�՚��q�?ƚ䀳NA?��pq�?�e�	�?�;"ьt�?� ���'?�i��z�?�O���Q1?��t"F�?�]�e�?�rf��$"?�ܓ�+?��sk��?�]
PƆ?�n����\?�0J�d?���Z]?�lx+E?�0S� ?��S(��?��Y`��?���6?�O���?��%��:�@1V�z�@H��7@��a��@��	��,@p�SG��@�GYGA�@	�{�v�@$|w�\@�h1^�@�[��@3��c>Y@$_.�@@0���&@8� @'�44y@9#�m}@S$��@u�'u�#@����B@��E�J@UqO�@UU-���@�2d��@�h,�l@ ,�/P��@ �vO�@!�����        >�,�)ɡ�?��M�Z?2��5D�Q?F����?Ua�d��?`�В`�l?h&�>�W3?pF,St�?tO��	Q?x�B�Z�?}^�1?��K�?�r��_��?���^�?�e\蔀+?�� t ^?���)�'�?�"�/�?��qiCl�?���f�y?��t���?��Y���?���0��N?���exH?�]ڮiuq?�P ���?�^,y��%?��[+�B7?��nL�@?�%�����?�s�.W��?��R��j&?�R`��q?�����m?��Jȁ�?�`_��?�Ie-��n?�(��@?�=���	�?�dD�ج?�����*f?�誷�h?�Hz6�Y?��F�4`?�H�w@}?���Ou�?���Hg�_?�v}�g�?�1�4��?�5�}&[�?�HO-��D?�iypM��?Ě?�w_?�گKB��?�,	Gw]�?Ȏ�⪖�?��-$��?ˋm��4?�%�_b{?�Ԙ?�#�?�K�ƘS�?�7�� 9�?�.�@?�        ?�Hv=��?� ����o?��K	���@��T�@����&�@"x�e�NQ@+�
F(<h@3�RS=�}@:.�DG@@�/�x�@D�W�u��@I4�V��@M����>q@Q�T�2�@TP)ce@W7��c��@ZHYe�v'@]�`m��h@`o�.�@b1�eէ@d=�J�i@e��^���@g�5i�w�@i���w�@l	���}�@n5)�2]@p8�^��`@q^�r�y�@r�����@s�g�0C@t����y�@vD}�Z�V@w�eZ���@x�Hq��@z<����^@{�f�m_�@}m��E�@~rS�V@�#K�A�@��c�lC�@�p��L�V@�4Ѷ�Dm@�����4�@��O��p@���/�c�@�d�JM#@�8�y�@���Y.�@����72y@����W��@���r;6�@��c��8e@�n�UOk�@�V�ݑ@�A?`�1@�.F���@����@�����@����6��@���ΐ~@�yn����@���sdm@�ud��_N        >�N'cK�>�D���c?�p��7�?4��'�~�?G��Vr/?Uu�6�k�?a�N���?j<���?ri�p?x��\Ƃ�?�B� ?���5?�x݁�H?�v��k�?�x<�qe�?�tz��"?���rO��?�1z��V?���0��V?��,Y�
I?����67?��5��a�?�l��!?�� Ҡ?�̓��?�\�X(?����	<?��2�r��?�>I�>�*?�
���?��M1���?��0����?���	���?�"k;��?��|9��?������?��5�E�?�dV�i��?ź�mhM?��U
?ȓro���?�Cټ�[?˨���(@?�K�mͬ?���j���?�`�6�A�?�J�����?�=T��|�?�8�THڀ?�<�tR{-?�I���;�?�`�"?����?اa���?��:�	i�?��?op?�U�n*P�?ݢ�k?��ax=#\?�+��H�?��շ7�?ᘔ+�?�U��y�        >�H]�>�/`����>�h��A�K?�t�?��?.�a�
+�?>�h��?I�4%�dF?S�z:�y?\�z�c<?c�{ `?jTx�r�?p�����?u ���&?y��hg?QΎq{y?��޿�s??��'A�6?���O���?��c�V�A?��M0ɧ?��MR���?�=�пC�?�'XIVJ
?�RJlS�7?��w��a?��dU ?���w�D�?��Ŵ�|?�H1�K;?�ς�+�+?��M;՛�?�:���ZF?����߆�?�|sȯE?�K"���@?�:��`�?�MEU�<�?���X� �?���p�Z?�5��(�?��^��V�?��{���?Ć�[��?�(q�@*?��"V�N�?ɼj�[�?˱j��ƙ?��iv��c?���,�?�'�D�� ?�c��?Ӳcd*�?�ǳd�;?ֈ���%R?��yH��?ٰ!�K�?�cڕC�H?�-��;?�?����w�?��p��A�?ዡĺ�?�+n��?��X�        >�	��Rx`>�9x;��V>�,���U>�	�>�l?yd��?�g��{?&&k��͛?0aHj�F+?6ۆF��R?>�*���?CϷO��?I���P�?O��t��?S�C�i�?V��o�c?[�~C|�?`W���)D?cG���?f����\w?jip�g�?n�*����?q��1�
?t�����?w�o)��f?{4�;rd#?.�?��.}b��?�U��@�?�%1�
��?�I�q�J�?���^N��?����s�p?� A!?�i:�"�?���d<)?��w���?�4�bF�?��w��?��=�/�A?��}��C�?�8ٮo�#?��si42�?�u��S�?�jj�!F�?�NɏA2�?�	I4:�+?�掾�?��K{y?�-�x�?�b����?����;�?�D#��?��vz�?�5�6`�d?����q��?Ə^�h�@?�fe�+�?�[B>�?�oL�kg�?Σ�g=	�?�}?"�B?ѺDS�-?�	�AR        ?'u�>��n?f0^��&e?�<>��?�]t��	?��q��?�:4sq��?����M3?�Eb	m��?���M%�?�v��r�y?����?�[h"�Dh?�&푬@?�q!%O�@�'�7 @ŝ̯�?@	0|/#W�@�_�:S@kz�E��@��{��@ϊ��;@:
=���@�S-��U@�2�'�"@eh�[a�@!7��p�-@"���M?�@$����H@&E�b��b@( ˒�@*599l�@,��s��@.:����b@09o*`�@1a򹳉�@2�86hڠ@3ٚ�R��@5)x��G@6�2E��@7�*P�@9mĄiS�@:�cE8�@<�e(��&@>9#���@?���dL�@@ݐ3g�@A�z)o�@B��LF_�@C���ctB@D�g�v�T@E���Ó	@F��~@HQ����@I7�� @�@Jj�6Y�@K�di�.@L����@N;ߌ�Ǘ@O�����j@Pz�6��@Q0��N�@Q�{�O@R��4˃(        >�c���*">�#��q?����@C?��9o�?1��Qr?@3-�,�~?JW�^�K?S�����?[���w)�?bg��H�?g�`Ay~:?m�n�5k ?r^C<���?v,��g�?z_;��^?~���P�z?���6L8?��VӪ_�?���O��?��:V��?�'%�E�|?�����f?�̕�/R?����!��?� A��Z�?�Iz���?��!���?�=�>JS?�uL*{�?���s�V?�V:_���?��~���?��ȧk?�/I�9?��Ѿ���?�Ǉ3t�?��XJ��Z?��j�׌�?���x��?��j��?�
�T�[?�/�0�ue?�^��c5�?����ƌ�?���ӣ!�?�'��"�?�~o�"ɸ?��߷9�?�H�dW?���_v�?���a��?��*�i��?��3W��?�u �/-?�F�i%��?�,-��b?������?�ّXՌ@?ƿ�(
?ǫ�6�"�?ȝ��U�?ɕ_����?ʓ	_+W�        >r��0f�>�e�an>��(�ݓJ? 蠯Q�?��LjmI?'��&8.?6+ha/�[?B�����@?L4٬��?T ��R?Z�ʂ��?ag >2�?e��`
�?j�0� jx?pۥ���?s#f�R?v]�*L0�?y�;&ތ�?~cz�?�:m^S?��8�*�?�t�~���?���]tK?��3-;4?�k�4vq�?��3��c?��T�)?��rvUķ?���9�?�(� s�?���15�P?�FY�>?�n��L?��һB?�愐�2?�$��&�?���u3��?��O��D�?�ˡk~W?�lA��?��c�ʂ-?�^A���?�\ŰP��?�N�v�a?�x%�9 ?��&3��?�
��+cH?�C��uZ?˧�}O\?�7X��B[?�{��?��h�ο?Ӄ"�1`�?�-cl|�s?��%���%?��#�D�u?��_` �?��;Gh<?�`S~��?�)��j?��=�4P?�9�0�?�����        >rRA��>����� 5>�w��I>�"9�^?�[�D?�x�l�?&9τ�P?1��K�?:�$�y�?B�,��?I��Μ5?P�*Ƶ�2?UZ)B&�?Z�qWj�?`r�fݲ?d ��l<?h-k,?l�Ș��?q�]�?t�,�b?wv���o?{Z�[f7�?����>o?�\ч�t�?�(��I�2?�K�v�U�?�ͽ=l�?���I��}?���u�f?�j忉-�?�f3��?���r�9?���O^�?�Ic�y?�)�m�&D?�2�?F��?�e��RN'?�Ĺ��?�R2�#��?�GԦR?��E�H?���L��?����EG�?���8Y�?�t#�w�y?�{e1���?����2o?���8��?�*����?�q�'g�M?��+9�]?�7����?ŷ�~�r?�L \T�?��h����?ʴ��?̊�W?�?�v��h.�?�=�2�#?�LOŽ�V?�g�b��/?ӏ���&?��ƢC�        ?
3h 9]?O?�؏�?v���?��h�Y�?��f�>?�e�J"�?���2���?��t�ʫr?Έl�ڭ�?�Mz�81�?���p7�?�O�&"%?���B��?���W�0?�lQ|��w?�q���?�A0�@?�|��3v?�%�"5 ?�l�T�?����@�	Eс�@�5���@�[#��@*���Q@
�gi��j@Dd:m@��Z@.�;{�@�䐄��@ [���@�S��9.@W�[���@�+}@�h��@����!@��R�p@ N�̣��@!W�����@"i��6}@#��5<�\@$�k���r@%�]^z�@'��P0@(Od�J��@)�mR���@*���\@,I'q�m@-����@*@/'y�@0J2����@1
K�$��@1���Х�@2���i@3e~x�/�@47�G��W@5� �C�@5�?�>�@6̌g��@7���'�k@8������@9�Dn��@:�ϽlZ