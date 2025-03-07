CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            h/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_75/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-030          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190901T143518        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?�q��{?�7	�|-?˘�MQ��?צ~�u˿?�ۀ�r�?�t{�� z?�
~s�=�?��b�_��?�`�'tve@ ���9q@���7H[@mJǆ~@)�;�@"0⳱�@�	� VB@��::�^@.�	���@�s?�{�@�G�q@�8���0@ 8�ԗ�/@!��bY[a@#�^�D@$�C��Ϫ@&2��8�@'�Vl�c@)P��]7@*��U�A�@,�3�͒�@.qn�6@0��\0@1y�\��@1��R<��@2�/({@3��@{d]@4�V-�@5犨�\�@6ךp@7�E�,
@9��;�V@:#��3@;>lG��@<]�D�3�@=�P�,� @>�u��nw@?�M���@@�t���d@Ajw�@A�Ӡ�h�@BY���t�@B��C��@C����E�@DBш׷�@D���U�@E�+ WF�@F>`�H[�@F땷a�p@G��`���@HKꈵ��@H���4��@I����Q@Jj�v>�@K#���p=        ?��0���M?�P%�r�?���0�?�Q�#{N?�WxhK�?��ư�?�$���AR?�:�/يv@Aܤd�@�8h��7@΃Ua/i@0�\y@����@p�Q���@�a-��@߲1���@ͫ�#�!@��x�u�@!	I�� �@"��0�@$o���@&;Zk���@(K�x@*\#�@+����@@.	h]��@0�5�QM@1&8��6|@2B���=@3eI��n@4��>]�@5�,dg@6������@88�u"�X@9*n{�@:�	�ʯ�@<��5�@=y��r�@>ھD\�-@@!�4+@@��s�؅@A�����@BO(��.�@C�P(�z@C���%��@D������@Ec��@F/�����@F�N���N@G����@H�o�&�6@I��@J[J���@K9�(�C5@L��*��@L��+�Z�@M�{�e�@N��#r�@O�q�C��@PUH|���@P�6t{��@QH��:��@Q�$�_�]        ?��,�?���&�?йG�&?ܰ����?��x��ǥ?���W,:?����c��?��t���)@ �?`��@`�[f��@bVe޶_@��-Z@�$� $@$9w6=B@�d^x@��5i�9@k�D���@u�D�h&@ �^�V�@"x�}��@$0�^�]@%�a=+ �@'��mf4�@)�}��r@+��v���@-�,�O}H@/��z�@0�P��Ie@2�>�&�@37I�W�@4_߶D��@5��)��@6Ʀ�*rN@8���A�@9I>Ӌ�@:�ȓ��@;�-���@=?���7�@>�����@@��&@@���@Art�WqU@B/�&�@B�t�8`@C�z�H|n@DwJa��3@E@п��@F�
�@Fڰ���K@G�a��V@H���V.@IXuX� @J2��b��@K�.;+�@K��.M@L��+���@M�c��@N���JT@O�����@P<Ȍh�@P�MSw8@Q.�k�@Q�u>�/        ?�wqن
�?�@X���?ު�B���?�L�II�J?��,=�?�ZHa~�@�����E@w?�`i�@�̖>Y@�����@E��n��@2B�XR@cuԜs�@!k�ӎY�@#ƙ�5@&@���?�@(�o^<�@+����E�@.cc����@0���A@2/e���@3��*P�@5cl�5%�@7&|D�@8˴�=8W@:���c�@<f}�/7@>FW�'�1@@!��6�@A
���l@BҐ�'v@Cf,6"@D+�����@E>����@FW+ft?�@Gu1E���@H��*gЫ@I�zZ7��@J�>�@L#�z��@M[����@N�Q���@O�� �@P��p�c@Q8Vf��`@Q�)�#$@R�iPڬ!@S:Pcݷ@S��?�e@T�o�2w�@UQ�o��@V�t�@V�a��m�@W|�L1�@X:��l@X��JQj�@Y�թ�J@Z�2�>�W@[G����+@\b/�@\�(��%�@]�g(Y~@^v�����        ?�@M�ͬ?�2mT�F?̧��`b�?ؐ�����?⸷W�u�?�p�W�vc?�2/E�?�ù�bZ?�f��>�@J���@�M|�_�@;�	
��@]n��@y��h�@47�K@r��Kp@�m⼅X@=��S�@���3�@hz��I@ �kP�!@!��m�~@#i�V@1@$���Y��@&m�]�~@'�I��@)���JX@+?�pTo@,�N���@.�cW��@03߿q�K@1 T��!@2���@2� Rz{@3�gx��@4ڦ���@5��?�@6�Uw6�4@7���]@8����@9��U��@:��sp@c@<d4�b@=(8A2�n@>C�^�*@?c�Է8�@@CpO�@@����q*@Ali�ˠ�@B���@B���#7@C7��^@C�B�>=d@Dr�*�5@E�R])@E��J�@FXh �5@F��w{�@G����@HMx7[�@H�ӝ2��@I���E��@JQv0H(        ?�VP�~Q?��=+��?й�Z���?ܬ׷�p?�܆w��?�䢃U
H?������?��I`E�\@ �"�`�@K�60$d@D�h�$q@�%gۜ@����N�@ 9�u.@����@K	3�%@$_k<��@4��t�@ �b7h��@";+!��@#��a�@%�idI�^@'qB2�@)K�ȿ|@+5
5<�u@-,{�w��@/1�g}@0���C@1�-���[@2�jC�З@3�J��~@5�$�@67��;`@7h���I@8�c 9S�@9�.��@;!��Ur^@<k��"G�@=�M@s@?����@@6�Db�@@����8@A��a�`�@BP����@C��2�J@CĨ y@D��)s\@ED"�X�@F����@F�=�Ü�@G�3���@Hb���l�@I0Ɯ�[O@JSU�R|@J�X�m�@K�ϖ�<@L���Ň@M[��=|-@N8��ν@O�Y�W@O���f�@Pn-U_�S@P�}�"9        ?�����A?��ŖR�>?н�aIiz?ܺs�S�?��
͌?���^4�?��KB���?�����f@ ����)B@O��@�Z@F�f��@�Ӄ;��@��\ӵ)@��~�WT@�'2jr@>(�)^@�U�)�@~�J�=@ �#B��@")�/pa@#ӽ�l��@%�ֿ�K@'T�O/�=@)+A �F�@+Ҥ��@-
�7�@/�(�ϵ@0�3�4�@1�3c�0�@2��c���@3� =�s@4�W�@@6��_r@@7>��KK�@8sۦcL@9�p,�v@:��T�s�@<4�l�F@=��փ~@>�����@@�<�@@���E�@AtT����@B(Hh0~@B���Ԝ@C�7�u�@DT%���@E���X{@E����C�@F�m�ZF�@G]���]@H&=�MX�@H�Z �@I��+'�@J�ܕHj@Ka9U���@L5��rE�@MK��2@M�<�@N�S�M@O�qۑ%�@P@p���@P��NcI�        ?��L��-?�*��;�L?��<B�u?�D�Vͧ�?����H��?�^_ �4@��#�S@	K��i�k@��tM��@8:k�=@��4e��@��@6t�V�@!�sJ�b@$>�{hM�@&�|��@)Z�K�]�@,HM��@.溧��@0�9��z@2m����@3��#l�@5��B�@7B-�J@8��I�`@:�����@<~��`�s@>Tzl@@�X'��@A	���@B	_J�X@C���@DG�L�2@E�[ �@F%r��@G8A����@HP;)���@Il�x�J@J�P���@K�Q��9@@L���J{�@N�t��7@OA���K@P<�D�@P����@Q{7���m@R�në@R�,��{@Sh�96Z_@Tkù@T�K���@Uh�I�s4@VvM�&@V�F	��@Wz�.g@X/H�h��@X�ċ��@Y�(�.� @ZXqs���@[�|r��@[ҟ�F�9@\�|\*7@]T-:�!�        ?�	iQ�9?���}��?����#?���@�o?�[�����?��f��p�?�[���?�U�j���?��M���m@ �1��D!@J���Q�@�@�p��@��� "F@���<�H@��!�]�@8��}d9@���P�@j���@��j�&@8��ɋ�@ {���/@!��>�_@#]Ƥ9h�@$�Njm}@&my��e'@(��\]�@)�'�3�e@+W�vV�@-\�j�@.�����K@0Od1�@1:�M�ɦ@2+�t��@3 J�6�|@4H��-~@5R,MX@6pì�@7$}�/��@81��P@9BJ��ͺ@:W���@;r}�T�@<��u�x@=�W]�"@>�y%�G�@@�n�<@@��˗V@A4��( H@AЛ�ߥ@Bn��'_�@C�&���@C��W=��@DT���0J@D��&x�@E�Ǘǵ{@FL�/vb@F��K���@G�TϨ��@HU��#&�@I�-*�@I��5��@Jp<�0@K'Z�i�A        ?���|��?�$>?�j�?�[�$�}?�^7�L?�V<����?�  �}Z?�)E��m�?��{�B�8@ /�]
�@���~�H@�&�.�@��ӢX@���9@bfN��@ۆa���@u��]@/c��H@Uҡ%�@���D�@!�*��ڢ@## 	
�@$����Ti@&~�<�@(A66F�z@*����@+��NT?@-ח%���@/��"�~@0�j̣t�@1��g�E�@2��;��@4	S��!@5*e��@6I���@7n]�L�@8��<���@9�����@:�u��z@<9�9ᚵ@=y��f/@>����$<@@���\�@@�ȵ��+@AX�O��=@B&0�&{@B�;�D�@Ch��E1@D����@D���$b@E�3���@FL��l�@G�K�
�@G͎R�I]@H���
��@IW�)���@J ��#P@J땵=�@K�����@L�u)�@MZF�E<%@N.Q�;ɓ@O��gf@O���� U        ?���xQ�?�E,WG?Ѐ�{W�?�Rww*��?嚕�ǃ?�"UG1�?�vi{K�T?�[�w���@ wg�W��@;�7I�@�����@B�G�6@f�
L�@ћ
v@`s�Xw)@����G@���!A@���x/@ y�p��@"�.��@#��U�-<@%{���?�@'E�oT�"@)�(�h	@+�M��@,�1`�@/���@0�f+��@1�ԦOn�@2�,ԫ�O@3�[�A�i@4�N}��\@6 �Y�0�@7S-���@8�����@9�3�PSG@;��y�@<\�T���@=���U@?�I}7X@@30��@@�xjL�@A�؋@BS5é��@C��)t�@C�Ǻ��@D����@EQ�l�3@Fض���@F�N�נ@G�`1�H@H~b]��D@IPtV��e@J%F����@J�Շ��k@K��W�2@L�kfѰ@M��K	'�@Nv)��@O[0TT*�@P!n]���@P��&n0�@Q
�[9        ?��-��?�mL
h�t?���u%�?�(�⑽?�BE����?��*b��@.�|�nf@�@ �@�^)me@�H~i��@{�*lN@p��?M�@�v�!�:@!���LK-@#��&\*#@&r�ȧ�@)�I�}�@+�@�LJ@.��z$=�@0�f��@2Q��|�@3�4m>!@5��1A-@76 ��@8����tQ@:�&�#n@<�`��?�@>jz��e�@@*���_@A%�T|@B&�SQ�-@C,�a@D8Ջ��[@EJ$�kR�@F`�%��@G|� ��@H���+@I�H���U@J�;w@L B�@MUƋ·S@N�>�Q��@OϞ�[@P����@Q.pO�ea@Q�UK��V@R~��C��@S*(����@S�
��_x@T�58"��@U:��W��@U�NI���@V�1��F�@W_GS�)@X��xd@X��<��@Y���(j�@ZY,힫@[��,�@[���5�@\�� /`v@]t��ް@^@�+|��        ?�*Vl��?�<4F8̀?ʓ���&�?��KZ|?�Y&���f?�|tv��?�`�@�
�?����\?�>�A�ɰ?��`��NO@	�k%PL@U����_@	�\�Y^:@�r%�M�@�8�J@Ò�<�@�E�#�@f�R�@e"�$��@þك#�@5�$�9j@ ]d��@!�]�-@"���Y^@$Y@��}:@%�`h���@'+��U��@(�����@*��ˏ@+��p�/@-.�p��@.��=@0.��U\u@0������@1�ؠq@2��~*�@3�5���@4e��[��@5G�K{:W@6,�aS�0@7.J�$@8 ��i��@8�@�	l@9��+�@:՞���@;�P��0Y@<��Z�/I@=Ņ��w�@>��yU�@?�:jw@@g�h+�)@@��[��@Aq���@A�v�V@B�}}�@CF�W�v@C�]<:d�@D"�����@D�dM��@E?N%$0u@E�x�Ke"@F`�^!Ȅ@F����        ?�8��h�?�6��SNW?����f?�6�󻲯?伷�Uw]?�Jn��F�?�l��<�?�=���}g?���Z"_@3�̻݃@�����@
�y��b@H,�%q@��b��@X�g�@��W%�@��㲰�@W�u%@>˔	9�@!!u�U�@"�Ȉ�nc@$P1"�@%�&%q@'����@)|B���8@+O�|5J�@-0s�(+�@/���W�@0���輦@1�`LЅ@2�;��t@3����i@4��Ӓ�\@5���,X5@6�
ޜ��@8�jtlG@9E��Z��@:v�6C�]@;��vs�@<��ڞv}@>(�7.@?nwh���@@\��&�@A�J1 �@A�?���@B\BTBi@C���̆@C��c���@Dq�`kT@E(�y��@E��}��@F�H,�4S@G[��P�@HC�'@HݼOтl@I��
�<�@Ji��yC@K2����@K�[����@L��in@M����@Nn~�@OBBOi        ?��DAT�6?��^̏8?��I˕gk?�C]G��?���j���?�_�)m�?�~[EZ?�RE�!��?���>�K�@C�˟��@�u�w@DAG�@dv?Տj@��^i@lmw>�^@� ��@���;Z�@w�]�_]@dT�U��@!7�a���@"ˡ�U�@$nV'��&@&gC�#@'ޡ�Dz@)�Ё"�Z@+��<O@-oDz��@/e%�	X@0� ��@1�(��a�@2ʤ��~@3�{��?�@4����H�@6����@7CqG�8@8q k-�@9���5��@:�U<,m@<r���$@=b�[���@>��� @?�7���@@�9���@AX�e�]@B�]F�Z@B��ɽ@Cr
|�o�@D*�^�LA@D����<)@E��|V�N@Fd�s��@G&�بa@G�H����@H��Q@I~V�Z�T@JJ�K��@K�f�}@K�gUx��@L���@M�#8z�<@Nmp�PL�@OH �^u�@PgO2R1        ?�����[?��˓ ��?�WO��;�?�%���?�(���"B?�N�J�@�g�@CZ���@ ��ǒv@�����^@
��$@�+��@��]×�@ U4k�h�@"}u�ph@$����b�@'|��@)�"F��+@,n3�@.��?,�@0���&�@2�Ϣ@3�GkU�@4�jo�v@6�
��t4@8
�+�K@9��H��=@;;��3�@@<��C>��@>�� 3EW@@"ex�� @A��,�@A�]��A@Bˮ��tO@C���H�T@D�T�9�@E��V��@F��W�V@G��mՒ@H����@I��j_Ű@J�=���@K��lw�@L�6��.@M�|i$?9@N�-P(��@O���1@Pu (O0@Q����@Q���$} @R"�ԶB{@R���� �@SH�l��	@S�P�
@Tt��>�1@U�~�Q�@U��wnU@VA�l5�@V�%ިT�@W|	7}�8@XO퉹@X��"Ϟ@Y]�D�J        ?�Z��zP?�/�څ@�?̕Q_D?�{<�Bt?�e8U |?�V 9!i?��@��?����/�?�Q�C�R@@�!�m@�X7��S@;�,r�@��c۸@��`@F�8{  @�{@r��@�i�;K@t��F��@׸���@�R���@ �帼��@"=��$��@#��|�Ek@%J.�1<�@&�C�N�@(�x[^d@*5PG_.@+��lm@-��%��@/��S�Q:@0�a�ϋD@1��,i�l@2�~[�@3�����@4��Z�3@5�+��F�@6����@7�3���t@8޴kW0@9�0 ��@;f����@<B���@=m]����@>��p7|@?�D�ä�@@��XM�@A#�f�@A���O @BhB�9l@CϳAB @C���F�g@D_�����@E��`.~@E��>6��@Fj]�F@G�fyxF@Gф��t�@H�7.Bq@I@�-�Z�@I��^��A@J��Vl��@Kw]��|@L8(�P��        ?�:�Ш�j?��%3
��?т? �S\?���rF��?��ì1z�?�$K��t?�����Rk?���)�:�@e�@6�m6;	@	^��l�@��o���@T�s� @�Waם@�I�b!@r �u�!@q�򻍘@��7Z�@!n|��y@##�$.@$�Ϫ�t�@&��I�0@(�i��=@*�A��i�@,�#5�@.��ȁY@0sr�v9�@1��#O�S@2�x ��@3۹���@5^%Y�<@6FQ?W@7�|����@8��c�:�@:�� @;q\#B��@<�u|��A@>0Q���@?��f�ob@@� U$�j@A@U ���@A��%�k�@B��>�;@C��(�W�@DM�e��@E�K��@E��ņ�@F��:��@G�	!x�@Hct��@I=�5��@J��N@J���฀@K�5tw�?@L���D:@M��m�Ak@N��Vө�@O�1��ݏ@P9E���d@P��'ܸU@Q-�@Q���:а@R'z�r��        ?��=�M�?��n2W��?���w�?�����?��X­�?� [E��?��ZH��c?�Ӆ8�}@ �'I0�3@h����@cx^�+@��3�}@�����@�ϻ!@��TH�@V�._��@,�a���@#i�&~@ ��x�2�@"7;��~3@#��䀷@%��m���@'_T@)3P�0+�@+KI+c�@-�L�j
@/1�ͻ�@0�N���A@1�X�@2��D��C@3���{a@4�S2)��@5����@7"�=Z�@8Q`,�@9���O�@:���P��@;��-@=C���j�@>���w�=@?��d���@@������@AEM;>�[@A�JA�@B�=����@CZ`h	�@D�O.�@D���I�@E���
9@FB} <�@G=fBj@G�5,���@H�[���@IN��!Q	@J���@JᑑК�@K�u�n;@L|���@MMG��1@N�&�n�@N�`���@O��ޖ��@PQ�����        ?�6�\@��?�K�d�c�?���]A�n?�P��F��?�����(?�m4f���@��W�5@	a�urZ@�� 3X�@S6؏�K@��ln@*�3�S@��vc��@"�tб@$��(ġ@'���P@)�Թ_�f@,���o�@/�c��5�@1G��J��@2�жu��@4~%W ��@6.Hn��@7��9��@9���-@;��6�A@=t��/@?e�/ ��@@�s��N@A�Vm���@B��y@U�@C�@l�N@D� �@F		5X)7@G,3��\@HU ���D@I��)ؗ�@J��B�T�@K����i@M1
<�.�@Nu�U��@O���"=)@P��F��@Q2��}v@Q�`���@R���U��@S@�~��#@S�m�(�@T��rQ�4@UfMn��@V"q6�o@V���({@W���7�@Xe\p�V�@Y+) 6�@Y�&?ЯU@Z�����"@[�0�P"@\Y�/��@]*NΖ�@]��ΝK�@^�W����@_�)븙�        ?��箕D�?�v�V�?�?��ܱV�?��I��I?�opq�?��+��?��]3�$U?�J�C)�?��Z�u�?@ .�Y�3�@R�&2F�@��dpS@
ND=/�@ �6�3�@1}�Jz@1����@h�x8�6@�ld�]y@���J@�n�YR
@-N��H|@ ��]��@"IgƂ8@#�.0�Oh@%$����@&�SH5��@('D{�v�@)����t"@+N� W�@,�XFǐ@.��f�e�@0&����@1fS��Y@1�C�n4I@2�?i�x@3�I�Ɣ@4�QR��@5�I/3cB@6�"�ڊj@7�Ϻ�	0@8�CJ.)�@9�p�6v�@:�J�X��@;�Ŭ�d�@<����@=�nSվE@>���Vػ@?�	{��@@x��~]@A6���@A��bk��@B)�b?�@B��t�@CRG9P�"@C��1�^@D�R
q>*@E'���@E������@FSb� �@F��-�@G��=Dã@H2�e�:@H��́k�        ?�8��n?��t���?ϔFX*w�?�
e����?䙲�#��?��g[�.?�zGR�l�?����R!?�LV2պ @S8�A@�ـ��U@
��Rs�B@V�-@�&�ѤT@6C�'��@���ma@dH��@)6���@�:��@!ŶB�s@"�޶�Ɵ@$/��p)�@%٘C�t@'�����o@)T��t(�@+&��ܕ@-��t��@.�`�i-	@0r��$�@1s�uI@2{=��LK@3�p;��@4�l�>�@5�!��W`@6�}v-/�@7�n�z�M@9�I�X�@:N�g!@;�&%��@<�ʀ��X@=��-�u@??��2�~@@D"��@@���c�@A�I���$@BAg�`>�@B����#`@C���E�@DT<5�@}@E	�9�X@E��3�~@F|1q9��@G8��T�I@G��w_�@H�����@I{�����@JAI�@K�h�X@Kґ-	��@L�f�=�@MlV�.�B@N<]E<��@Ov�2�        ?��/��?��>t#?�?Ф���<?܎w�s?��Ci��,?��fxb��?���XY�?���-K�a@ �c���@C���@<g��@����	�@�K��K)@�s�M��@�K���$@N����	@+Zǻ�T@)��l�	@ ��41�@"E,!�+�@#�yZ̰�@%����g@'��]3�@)c��*9@+Q&n#��@-MS�� @/W��<��@0�V�"@1˳ra�)@2�@4�֍KU@5.�D)�@6\���sg@7��G��@8�ū��@:<�.�@;U�=��]@<�ǴU@=���4@?Q��U�n@@X�W!��@A���@A�R�u��@By�-��@C5^��@C���S@D��WH0!@Exh
а�@F>�a�c@G��(@G����O�@H�p��Ð@Is�ќxa@JGH�0��@K�X�}�@K�mQgWc@L��̓JC@M�����@N��3/�@Or�d�t@P+��qjA@P��� �A@Q����        ?���2; .?�B_�H)-?ݿ����?遈�Q�<?�rvh��h?�z��<@g3�?C�@��<��@��8��@_�W;@��`�s@J��zML@PBJi-�@ �!�<�@#
��?@%f��%�@'߱��~@*s^˱%�@-!(��-h@/�G
��H@1d y@2�ԇ3@4gM氰�@5��0��@7����@9@���V�@:��v�@<��%�M�@>y����@@%����^@A�����@B3��}@B��z��@C��	��0@D�b��@E�)FT@G��.�T@Hz�YS@I(���:p@J?u���@KY��K�@Lxh/m4@M�Cd�@N�(����@O�
��R�@P��oe�@Q'E(jY@Q�J�@R_�pb�@R���.5F@S��@�z�@TB>V�@T滟v�|@U�1,�@V5
Py@V��?��@W�Tb��@X7�����@X�xy�|@Y���!@ZIX��ep@Z�HG�͕@[��=�`�        ?���;�O?����	A�?��A�g�L?�3��\i�?��!o���?����=�G?����?��,��?��M�>Ο?�Z�ֶ�@��|��h@�f���@	�3f���@G�z��h@�tίg+@�M>��@޼,4�@%����@��j���@���nv3@�w@p�Q@ ��G� $@!�Ă��@#[:>�]�@$�!���@&K���h�@'�}D	�@)e��e��@+�y�-�@,�;�!��@.Xp<���@0	7g@?�@0���;@1ѫ~�;K@2�d�*�@3��vm@4�����@5��S��@6�ߣh$�@7�AN��4@8�!y�v@9�v���Q@:�8Z]��@;�[����@<���9�A@>��"Y�@?'�rN��@@&u�CX@@�.��@AQ�_"z�@A�� ��O@B���6A�@C"�{�d@C��1M��@Dbfe��@E?�Tt@E��@FP�M�t�@F�tI��z@G����@HP~;���@H�՚���@I����        ?�9�&!-�?�+��켥?ϵ~���^?�(�4�b?�ȧ^�d?�:��U?��eE'�?�0Rɠ�d?�r����@)�s8��@��1�@
�	H�S@8�w��s@�/��M|@O&�+,@�]���@���@	�@J�/�=�@0�`��W@!�+��R@"�f(��u@$F�3��@%�䠺%I@'�7�#��@)o��ug@+A���X@- c�>�Z@/_�PZB@0�7� @1��0��#@2��x$$<@3���[�@4����~@5��}}�@6ߋ��&�@8��d�;@9*�V�
@:Xr�lW�@;��}��@<��Ч�@=���I�@?APpk��@@C���@@���n@A�ϼ|�@B<N�R;@B�'ց@�@C�URy@DI�3/�0@D��_�Z�@E��&���@Fk�#.�@G&|cud@G�;R`V@H�+����@IcI0��
@J&���@J��ML�k@K�~H*R2@L}���]@MH�kd@N��;�@N�dq3�+        ?��k["_)?�²H�h ?�ŕs�P�?��P2**?��=���?�6%��?��&JW��?�Ȟ�w�@ �g|�K�@eM<�1@b�$$@��p��@�"v͍A@R48�q@�hԮ��@a`�٧�@;J a@6E^��@ ���E@"F#�(�@#���M��@%���t�1@'ymi{�Z@)R�	���@+9ڪF�q@-/(�+@/24�fH@0�4(���@1����I@2�1h�@3��:�ĵ@5���O�@6*���!@7X��h�@8������@9�f����@;u���@<Kt��@=���":@>�"�y@@�uL��@@�Bo�=@A}���'@B0X��R�@B�SY �@C��vw�z@DZSA�U@EPoE�@E��-��@F�2W�+@Gb�CZ�@H*����w@H����`@@I�;[�)@J�lv�Z�@Kf'���N@L;g� �@@M))V	�@M�ha���@N�"	���@O�R�'bM@PE|]BD<@P��/�б        ?��F6�)?ˆ�6�f*?��i����?�ޖSu��?���u�6?���ƌN�@��SS�z@(m�� �@�Y0�@�	+@D�8�b@��>l/@���|a@ �ނi®@"�H{,uj@%�+��@'�i�8�u@*&�6d��@,�K�%}@/�'?EG^@1C;䓾3@2��4c�:@4O)�L@X@5��V%�@7�0[�~@9>)�@:�,S��$@<��J&w@>�1\�@@;���J@A1w{�H�@B,�~��@C-.q]e�@D3D=57�@E>��}g�@FO�a쪖@Ge�:	�@H�3:ƕ�@I�����@Jǒ{"��@K�oh�.@M"[�=�H@NWL��t�@O�9!�,@Phe�?�@Q	��B<�@Q�>�8W|@RT�φ�@R����@S���r+�@TWc�}/>@U�Y��@U���0+@Vn�\w�@W%��`n|@W��R���@X�U]�e�@YW��yր@ZԵPˤ@Z�ٙE�@[�<�@\dY���@],����        ?�ro��Y{?�8�°:�?��\�@�j?�a:�?��íR?�`c6$11?����u?�p(��T�?����� @����&�@6�l�O�@
mS���@N,��@`�nO:3@��0	�@5���-�@�L\�E�@�g�2z�@`�:Vz�@ ���=:L@"3y�~a@#�|���@%ov��?@'"-�v@@(�l3p�@*�Z��P@,��2�W@.r���@03��ZU@14i��@2:�#��6@3G�zA��@4Z��tf@5tߔ�@6���x�@7���m��@8�?7v�A@:q���F@;H=ezP�@<��fu��@=�X����@?
�t���@@+ف�Z@@�e�o@A~a���@B+��T@B���I\@C��W���@DC��1@D��z��@E���^@Fr#ϓ��@G1{�=@G�sI�l@H�.����@I|F?c @JD�����@Kp�2�@K�v��Ea@L�����@M}K	ދH@NQa�|@O'	�,|        ?��7��J?������?ы +	��?��rE?���aߴ?�7?>͞�?���6ﲯ?���QSy@|8R��@S��פB@	���$q�@]���@lSlh'�@�=1���@����7�@�6NcN�@�^���|@�|�ý@!��j:
@#;7ʠ0`@%d��AX@&��P^@(��v���@*����/�@,� M���@.פ'�%�@0~�%�@c@1����c@2�uǩ�@3�+�8}�@5��@6I���@7�=8�A�@8ˏuU�L@:��0�@;h�E�#@<�0Ɯ*@>���o@?��U�y@@wR9�D�@A/����@A뷲���@B��l��l@ClZ��@D115��^@D����N�@EóC&�@F�KJC[�@Ga���)9@H4����@I R,c�@I�Ģ��	@J�@:�í@K�k��@L~@<�:@Ma�Ծ36@NGőE��@O0iSP�}@PͮT�}@P���"�C@P�Ɋ^�@Qv&�d��@Q�A�        ?�M`���l?�2���?�-�TQ�R?�7���s?��z�=?�׾����?���fd��?��~�I�@-L�kL�@,�C���@
���e@9���@ Fd1V@͑$�v`@�T��7�@��/�	@�ag�^�@ ��i�� @">/q���@$�;\��@%�ˊ��@'��kg�@)̲��q@+�&� [�@-�,���I@0§ҥ�@14{�A�@2\):��@3��mqԵ@4��9߉@6����@7H�C��@8��[Q�)@9�jB�rJ@;I^)�@<��Ņzq@>!A�@?����S+@@����AB@AC!�\TS@B-[vl@B�W/��@C�>�O@DgK���@E8��
>#@F�SC�@F����2@G��2�*�@H��C���@I��I��@Jh+7��>@KP��5Y@L<��U�c@M+�=��@N��>\
@O�Z:@P��y�@P�n�=� @Q�J�\�@Q��	�`�@R�E�(@R��EoЩ@SϺW�        ?�]/�Bb?��.~3�?�����?���ˍ?���W�J?�3_����@�髒�@
�e�1�@٧���0@�w���S@�ZjDj@���0+�@ �|3��`@#J���?x@%벺f<�@(�����@+���v�@.�;*�F@0�h�˓�@2�T�(^U@4Fy?���@6��</�@7�<[���@9�R@:>@;��gq1A@=õO��h@?֕-��_@@��L@Bՙ��V@C2��h��@DX�$3z@E�O&��@F���@�@G�����@I3�DT��@Jz�;i�@KȠ���@M��ϗ�@Nv�}/��@O�iV.@P���r�@QULo̙@R�ir6L@R�̢�3Q@S��yy�q@TK���|@U����@U�j��b�@V��1�C�@WpX���@X@R��M@Y�|@a_@Y���D�@Z�D�>@[��l�}5@\x,9g��@]X �F�;@^:�r�c@_�H
�m@`��/ @`x�����@`�.�M��@af�q��        ?��� V&X?�/W�8�?ˇ{���?ג���TL?���Nă�?�W�0�UM?��*u���?�Ю��9?�9�<��@ ��A�@����@F�Ȯ�@
���q{@�Y�ÞK@�!�{�@�u��o�@Oo�+$@e��f��@⋛@��@w��@ 4��N�@!t>��1�@"�ҋo,@$Z/T�@%ݝX�n�@'k���<�@)Wg�r@*�?�Wf@,TC���@.8my~�@/���hy#@0�'�� o@1�I�B@2���7��@3����OW@4���B��@5���\s�@6���,Ի@7��O�%@8��M�@9��K�@:�x�@;ϖ�np@<��O� �@>K���@?*��Da@@(��,ɰ@@��u?@AUTʫk @A�Td�@B��0��'@C'��2@C�:�>�P@DgG��/F@E
:�YZD@E���@FU�]1�@F�D����@G��߬4�@HT��{��@I���{F@I�N-(@Jc�6b�        ?���Y6�+?���p�L?�ޡ9�� ?��Hǝˏ?� �T�?����[�?��t��	�?��?F%�@ �̱���@c��#��@_���J�@�_S�@��qH�2@�<���@�'G�1@]�TL�@7
�26o@1u��HG@ ����@"C���@@#�`�~�@%���K`@'t�ǚ�@)MxRA�@+3���fI@-'�9�`e@/)ÆM:�@0���#U@1��E,�"@2�n3���@3ڀ�:7@4��6�@6#m��P@7Q(�~7@8���> �@9���]�@:�x�ų@<Cu��U�@=��!)e@>�`��J@@��5��@@���x�?@Ay�	�;�@B-�I@B��V>�@C��e+M�@DWBqT�@E>�@vr@E��`�@F��m��@G^���CG@H&�3�5'@H�65F��@I�<L1�@J��!�@K_�O��#@L3�Q�9�@M
a�X�@M�X��@N���Շ�@O�H�lG@P>?~� @P�?k?�        ?� %C�'�?�A��"S?��{����?�O��d�?��֊_�*?�jaظ�h?�5\@O;?�]2��<?��b�K�I@O��՞@��@&5R��@�+@��i@�nך�@ɿ��@�<�1�$@��lE��@���*�@!P��9�@"�����`@$�^KT��@&A�T��@(���@)�/�0@+���~R�@-�m'S��@/�hTݣ@0�>���@1�,��X�@2�=&g�@3�V��N�@5`�
��@6-D�$@7R�d���@8~I6]0@9�BD�B�@:��/�Q@<!ŗ�:�@=c-S�@>����'@?���c��@@��)߿Q@AN��1�!@A���C��@B���2@C_�p}��@D[���H@D�9;���@E��� �6@FDJ����@Gr�k��@G����b@H����?@IO(�l�@J��r�@J�M��%@K��-c?@LE5��@MP�@�Z�@N$��݃@N��B��@O�pbj        ?�B㳫I:?̮M_4��?�+�[�@�?���x2*?�{�k�?��_���s@����s�@����@泔5@Ju���@�΅c@�it=�@Ѽ�O�@!�F�u�@#f��Z@%��,��@(]�:�L@+�L�(�@-�G���@0Sh�Nva@1��u� @3Y~��aJ@4��.@6�[�s��@8A.��@9���B0�@;�v�A�@=�����N@?q�xl��@@�0��A@A���ō@B�%�P@C�{����@D�%���k@E��ݪ�~@F���p�^@G�+�+�@I��M��@J0C��v@KW�	�X@L�TW��@M���6�@N��4���@P��7�^@P��	0��@QS��cC*@Q��1J�@R����V@SF6�Մ�@S��6j�@T������@UL`�`�@U�_)��@V�x�@We�T�ܚ@X���@X�4�ȁO@Y��v	m@ZN����@['FU*:@[�g�6@\��
�F<@]W�"��z        ?�$��$?��S�z?�R͉��?�Dm���?�}˄:?�%�"Δ?�x��r�?�z��?��R0(@�k@c��^@���@�٦4�@������@O���@=��E�A@�����@��g@����@&È[�Y@ nd��[b@!Ը��@#F7N
@$�7��@&H�zR@'��ǃ^=@)t�q�ru@+�3�(�@,ȵ���@.����n�@0!R����@1�#�|�@1� �R@2����@3�ށx�g@4����*@5�"H��@6�y[�@7��\��@8�,W0%1@9�chp�@:�l���@;�8�*k�@=�����@>+�rK�@?I��|�@@5mZ�~@@��ɏ��@A[�w?6�@A��VJ@B�=��ʎ@C"eأ��@C�0ͷR@DY����@D��!W�@E�,�2<@F8M~��@F��#"��@G%*Ǜ)@H$�vm�c@H��d@It�F�F�@J�6��        ?��` �f�?�AeJ\a?�����?�9�/�?�D�m�B�?�t���Cz?���*�?��7�@ �3��~@�ޱ��g@�)���@�7��@�H)=.@Q���@�8�\$�@�C����@��{�@��^�H@ ��n'@"�-�.�V@$;ISmEx@%����@'����@)��DG�@+�Y1ET@-�e�wW@/��_V�@0������@1���dZ/@3���y@47ݮ��#@5`���@6���3�@7�EjfR @97�D�@:Cn=�2@;�Ԃc�@<�Wn��@>.�H�Ʉ@?�m�֒�@@t�~z@A(͵��@A�,��O�@B�"�fΥ@CR��+9@D��p`@D�Ӥ��@E�X�e"�@F^Y�3�@G(*���@G�}ԉLN@HÒ�;�?@I�Ki���@Ji���l@K@���{(@L
Fg.�@L���@MԢ̞V�@N���֣@O�?�Ѓ�@P?��Ͼu@P�� Ω%@Q)XB/F        ?�k��,+?�Ǻ`�R)?�5j�f!�?���C��?�.��RS�?���b;�?�
!!���?��(jM��@ Ghm�@��W�H�@v��,U@�U-fnz@ ��Q��@YP9�C@�x���@qBK�@.�f�V�@h��p@ ��Qd�@!�b��@#/��;@$ڊ9C�U@&�]�ʻ@(\N���5@*2n�D@,�&7�s@.BO��@0��o@1| �T�@2@,�h|@3%E�"g�@4=st�D@5[���@6�X���@7���?]@8����@:׺��@;KN'}��@<�e5ҏ@=���t@?1���@@8c���@@�۱���@A��[x�%@BB�0 _�@B�	�WZ�@C��h���@DdP-^-@E3�#
@E܍���x@F�W�˱�@G^���v@H#$,T�@H�Ox��@I�nϗ�@J����@KM.�ң@LPk�n.@L��W^��@MġF�@N���/��@Ot����@P()��        ?��LK�ы?��ӳ�nq?�j*��?�?��ͯ�?���}�#?��ŕ��%@j�o,@�S7�T^@16�u@��Ɇ�@�$���@�q;��@�Ӯsc	@!�ϳ�\r@$/Ɣ�O@&����@)&��b�@+�t�[@.�zw�o@0�#2��t@2Q��&�@3�t��2@5~+~�� @7&�_`�@8�$���@:���d�@<fc����@><�N�M@@xRY7@Ar�u@B Vt�b�@C �^�8�@DO���@E�KS{ @F 9n�G�@G4m	��<@HMUmAj�@Ij�k�e@J��c��@K�e#�gQ@L�?o-�@Nb�)U@O@�	��1@P<f�0�@P���	�r@Qy�����@R���Jq@R�Bm�@Sd� �H�@T��*��@T��4�2@Uag@�5�@V��	u@V�����w@WnihC�@@X �"�|�@X�Q5�a�@Y�_��d@ZC#ӯcS@Z��{�@[���K!@\ty�Y�J@]2�J�	#        ?�� ��?�ԕ�;e?�?���`�?�6ʐ��,?�t���q]?�2���?�t�����?�wUB��?�c� 7@���S@ha~���@��?�Q@̓?��R@����@Y\A@M�G?�@����*'@ĔO�@���@��@I��%_@ �޵ߺh@!�R@�s�@#aeG�@$�>�Ƃ@&k.��m@( 0%|��@)���`�}@+H����@,�b��V�@.����bN@0@W{��@1(-���8@2��p�@3�,s;@3�����@4���%ϫ@5��9�@6��85��@7��>_�@9z�n�@:~Q���@;*�61�@<A��L>1@=\jup0@>{-�Z}@?��a ��@@b���@@�L�c@A����,@B&��L4�@B����{�@C]0��|@C�%�9��@D�����@E<B85��@E�_��+@F�,)ĸ�@G*�p��@G��K���@H|���$l@I'�e��@I��*�0@J�����        ?���L��h?��X��F?�o���� ?��]��?�f���?���a��?�c����?��n�P?�"��[�@���<,@�4� k�@
�����q@�ex۽@�Du�6@j�pP�@�.�Ȣ@0�g�c@�(km�&@��O��-@ ���$|�@"iz�gT @$ ��+N�@%��-�b@'VrÆ��@)�X���@*�w΂��@,�����k@.�˛�=�@0Du#��.@1A���*@2E���<@3M�DXj@4\UH͖�@5pH���@6���6@�@7�eD~@=@8�c^Hx@9��I�5u@;#ו5BK@<W$��c@=�ac��@>�}���@@4�TG�@@��˲/�@AP<Ǒf @A�AK=�$@B���1d @CO.xo��@C���.^@D�)�++@Eb�8��@F
n�Q�@F��-��@G���a��@HE����@I��QU�@I���\�@J�i��+�@KJׂ��@LUl=k>@L���qj�@M�w��@Nq��/        ?���K��?��lrE�?�~4F�ͪ?��估?�艋��K?�0��X�?�����NF?��p��*@q�=ɫ�@Dr��Z*@	l�]���@���Gm@Yk9K=�@��M4�@�%_�@oEz��@jV�H�F@�����{@!d�qB�@#���%�@$�f����@&�Q3��C@(�/��3b@*|��m�E@,}��נ2@.�����@0V�&㧱@1m|S���@2���r@3�Ŧb?@4�q벹@6ӓs��@7KI�$�@8�#[�H`@9��PIRL@;"F�H�i@<w2����@=ғf�E�@?4T%��@@N0����@AU�8�@A��\�[@B|ԟ9o�@C=��*t@D g�>C�@Dƣ�5s�@E�ʑ��@F[�3:b�@G*�a+�@G�s���E@H����4@I�N>l�@J�`R��`@K_+�f@L>�&��@M ͨ��D@N��M%�@N��H)e�@O����L;@Pa�:
�}@P�WϬ��@QR/0�pg@Q�I��)n        ?�̵Pӽ?͸�ca�?�MG �V�?��gQ���?�v?˪�?��b��1�@\��u�@줺�U�@%�_{@�Y􁵻@�06��@����@ڜ�>@!��b�]�@$y�wz2@&��xp3:@)$�Dj@+ۙ���D@.��9/ֿ@0�{�Ҡ�@2R�[��@3�u�'6R@5���=Y?@7*(��|*@8�u���@:�eLf��@<l��?^�@>DD~+�@@cN��@A
�� L@B��i�@CZ��@DHL��@E��yN@F(��Wd@G=�3G��@HWT��R�@Iu��w�)@J���m��@K�R�[@L�Zm��@N�b���@OQ�k`�@PER����@P�����:@Q��$��@R'w�GW�@R�C� ��@Ss�YI@T�z� @Tƀ�FE�@Us�LI�@V!��7բ@V�
s�� @W�M��=@X8i�D\@X�Z��\@Y�����@Z_�F��8@[�N�@[�(?5�@\����r@]W���f�        ?�����
?��M��?�|�\���?�D�L�?�?�,�?�.D++T�?�0�+.�?�f?j7�q?�1��a��@�`��V}@8�3�H@��)���@�^W��@��?7q@����@���@y�3���@���5j�@�4�>�@V�G���@!�v��@"�X���j@$�W�~@%�:�1T@'"]�c!�@(��_O`�@*iۻK�%@,�6$?�@-ٛ+;��@/� ���@0��Iz�@1�׈<c@2�7>���@3�'���@4��:�S@5�y�&�@6����@7�L��@8�#�N"@9�/˜@:�b�4�@@;ر��VQ@<���Ƕ@>i�
 �@?9��� �@@0�68@@� ͏�@A^�>c�"@A��||X�@B�UǤ�@C1�I�U@C�����I@Dq�pQ�1@Em]1��@E���/@F^��}�@G���@G�6&
��@HY��Ր�@I���@I�Ӧc�c@Jc��7�@K��d^/        ?���H`�?�;f\Q�?�i���׶?�&�7�!?�l��3�?�B���	?�B��we?����@ G����@�A�NE�@����7@�9����@+2� B@��E�H@
�
./@�{��@rH�nZ@V�m;M�@ -f�@!������@#_o�\�a@%�O(��@&������@(�A���@*s��x*@,\Ț�@.R/?nS@0*��b/�@13MUGDy@2BF��^@3W���uQ@4s���
@5��ƖV*@6���ߙ�@7�I%V@9 ���	@:[)X%�@;�{ ��k@<�����@>-���@�@? .�*�@@k/�e@A����@A��K�~@B~�RЪ�@C5Ohqb@C����H@D���_�@Ei(f��@F*\�Y��@F�'�A�w@G����3e@H}j�i&@IHԦIc�@J�:L��@J����@K��"�@L�!�٣�@Mf��l�@N@�i���@O�x���@O�{%�m�@Pn)ц�y        ?�g��xQ#?�GN�?�)�}-�?�q��o�?�s�v�ʢ?�d��&�?�@s��bk?�]@�C�O@�wy-@���_�@�+
�@I��|�@�d��T@{��c��@�6�@�2p���@�I�N��@���@!�==@"�G@x�@$c!�1�@&)�7Ɉ^@'��M4�@)�iŅ�)@+���X@-�-�5g@/�b}��@1��eT�@2���U�@37��*|@4[Mo�g@5�����o@6�i@�g@7�����{@9+����@:o��S�@;��g0�@=
j6��n@>a��@?���M}<@@�%k��@ADl��:>@A��2+�^@B����Vn@Cr�ѽ�b@D2��H�@D�9�ߘ�@E��4Մ�@F�Ѓh��@GM��	F<@HJ�ض�@H����u@I�q�M�@J���+K�@Kly�ne@LF�F�|a@M#�3~h@N����@N������@O���`<<@PY�0X�@P��=��@QD9��X        ?����P�?���!�5u?�M��x~?���y��?�NM���>?��j�F�@'P���@	��/���@/�H�*�@�~��-;@�霣�@��Mi�@ 8ܾ�@"Z�f�[3@$�B�,LA@'b�zS@*�*\fq@,�j۫\3@/�d��	@1jT�xK�@2��x@4� (��@6A�Ƿ��@7��n���@9�	.�@@;��"�@=a#�y�@?E��O/@@����W@A����@B���7�@C�[�vV�@D�f�U��@E���ȸ�@F���=k�@G��A.��@I�X
�@J;�����@Kf�ʰL@L��S�j@M�F!X(f@OgR�t@P >���@P�6v��@Qdka�/�@R	�N6��@R�oħ|�@S[/��G=@T�Y1�@T��*�E�@Ud�l�T@V��mn@V��l���@W���@X8q*%U�@X�\F$@Y�c?�;A@Zj��$�@[)z4��C@[�&�A}W@\��,��|@]p����@^6�-5        ?�G��9?�8񲡽?�x�bG?׋b���?��^�?�X�c���?����N�L?���|;�x?�E@4��E@ ��fw6(@�oJq
^@V�g�@�Ȋ}k@�xj�@�d8��9@�i6��i@���I@}è���@���ߌI@�o� s@ #N>��@!�M��+!@"��A�@$q�?��@%�s�yW@@'�/+[I�@)#�Ǘ��@*Ɉ���@,y�Z�z@.4N�σM@/��|�
Z@0�{:A�@1��್@2����_@3�w[�oF@4��4V/�@5��h3@6��TRb(@7���'6@8ȫ'C@9����y@:�&��%@<	�qX�@=(�^�@>J��y!.@?q��f�9@@N`ۥ�@@��qA�@A��B�F@B�䦵�@B�OB�	@CYϓ�@C���2��@D��n#��@EDf���@E��]��@F��k�2�@GAD7j�|@G���3�@H�.��M�@IO�����@Jɂ��{@J���)��        ?��-�0�?�(b���S?� vnA[?��* m�A?�}�1u?����S?�=���x?���LC�@��e�a@���h��@
 ��	X�@�����M@��#G��@�M൷r@L���=@@�]U-�@[8gϾ@ M��t�4@" >�~u@#ěٿ� @%����>@'��:v�@){L�;��@+��a���@-���D@/ɍ���@1@$[u@2'B�ݙ[@3TH���D@4�Ug�@5�frD��@7	N�ʶ�@8T�z�f�@9�c�g@;j=��@<b�iﰮ@=�'�SpY@?:�㷧@@X���R`@A�U��@A��a�1�@B��e��@Ch�(�Zt@D5�e���@E���E@E�ߒ�|H@F��D��@G�lq՗ @Hf��pW@IF����@J*��]��@K>K�@K���b�@L���@M�/�-}@N�W��"�@O��"B@P]fdg@Pۆ�`�@Q[%�e�@Q�?�FQ�@R^ҹ��@R�����|        ?��!��?�6����?���;kv�?�IM3W�<?��ç6�?�b����?��&��?�U�|���?��7��3�@HSY���@Bn|��@��@q}���q@�{3@w*�뉸@+8V�H@�a�}�@�0$�@w���3�@!A�lr�C@"�J����@$x�9CFZ@&)��/�@'�4B/�@)�1�(ݚ@+�ܪП�@-qw��X�@/c�w��@0�\�j�G@1���@2����@3Ԋ��P�@4�D��:@6	��<@7-:�wW@8VO[�%;@9���υ@:�B��y@;���,�@=20>��@>vrf5�@?�_Z6@@�l�y�7@A1]��W@A���~N#@B��.x��@C>3tO�^@C����@D�TM4@E`��l�t@F	�l�l@F�pCѼv@G�-�0e+@H[<����@I�d��o@I�9�p�S@J��US�@Kz4ku�>@LG�&�*?@M�V��p@M衷���@N�l�1`>@O�Y���        ?�I��JE,?�۝���?�d���H$?���Q�?�߿_�o&?���IJ.@��n|@:�4�A@Cx�@rV����@m�;��@�F��
�@P ���@!<���5<@#���-�@&���I�@(�x�Q@+>?�}��@.3���L@0uӊ�#@1�z�π@3�Dxm��@5隳��@6�(�RG
@8tħ���@:3�?�~�@;�'f�%�@=ԀI=�j@?�]�{RS@@�Ɍ�%�@A���`��@Bϭq�:@C�ͧ��c@D�HݾU�@E�Q�]@G

.��@H(.|��R@IIk�o��@Jo��a�@K��=���@L�/��3@N IL��@O:<N��X@P<}��@P�> M��@Q�X���@R(�r��0@Rш�"��@S|���@T)�?��X@Tف�=Y�@U�VL]�K@V?b@V���-�@W����@Xh�[tʎ@Y%sp�@Y�^��EF@Z�ob�;&@[h���A@\-�P�\@\�n':@]�k@�z        ?��Lڵ?����+�T?��#Ɏ�?�5S�6i?᯼b�"�?��O�]-?�[�Q?��e7Ŝ�?�����@ [�l�@�j�SO�@�(���@
�S��@v�"��@EM�%G�@iG��\�@�}�4+�@� ��CQ@iwQǏ�@��m%P@��o6P�@!��M�u@"����e@#���ʉ@%d���e�@&��ݢ�@(qe!+7�@*Q��1@+���� @-LC���@.�����@0[Q�`@1<��r�/@2",�7M@3���@3��r�@4����@5�/�C��@6�ZQ���@7�u(�ۜ@8�q+V�@9�?��+@:��3�@;�%|�@=
%��c�@>�^C8�@?7
1H��@@)k�-�H@@���W�@AJ}{UK�@AݟT�@Brv��d�@C���y@C�1뷊@D;(x�@D�~~��@Es����@F4�v>C@F�jd��@GT*jd)�@G�oE�o�@H�3��G@IBsrWey        ?�����?R?��Aи�?�5n�=?��O�Ѯi?�'�&� �?��"s�Q?�2�AȂ?�ñ'Րq@ a��c@�Aο��@p���@��r|	@��R9�@U���+@�[W�W@l�{/5�@)v�]�e@��&�@  ۲/d�@!�ٰ�C�@#)�~���@$�$��Q�@&�����A@(Sġ�9F@*(��,z@,
�=�@-��y*�@/��`\�-@1�"�0@2�p-�@3wh��@46����@5U�VD�@6y|�Ұ�@7���q�x@8�\��'�@:
��Vxj@;F�o��@<�Y�M@=ϻ��Cc@?�f��W@@7��w��@@㦐���@A�f4�c@BC؞� X@B��qqg7@C����ޚ@Dh!_�\K@E$��%@E��S"�@F�ʧՋ�@Ggl�CH@H-���#�@H�1I@I�G��Vo@J��>X�O@K^���c�@L1	��o@M��w��@Mܭ{��@N���]�@O���?�@P7�@��L        ?�����?�@�� ?ϩo�cQ?�'Z��̴?䳼0��?�?�/3�?��R\w?�6 ';?�zZ�@.��-Y@�H�V�@
���q��@?���a�@��p.dU@SC[��o@��V(�@��(�7@PHsNO@6�0�V@!���L@"���3��@$Jy�A%�@%�ͷ�@'�p����@)t��֙@+F�QWt�@-%�Mu�@/��⊎@0�&��B?@1��OOо@2�G'�S(@3��,��`@4�`	j�@5��J��@6㦒�m~@8��1#�@9/L���@:\����@;������@<�"l:s�@>�f��M@?D��NE@@Ew��[z@@��3T��@A�o#G7�@B<Q�� �@B�m�� @C��n��@DG6GB{Q@D���y��@E����߱@Fe]G�@@G:�ɉ@G�1�@H� y�V3@IT��7h�@J�ND�K@J�`���@@K�B ��@Lc�1���@M+��8��@M�$��1�@N�2�        ?�^M(�?�j�����?���-��?�g�:�k?󊌀�\?������@|��E�@�*r�2%@�z Ż�@�턤@��~aP@d0�!��@mQc��J@ �nl)�@#;���@%z�0�z@'���2Z�@*���^� @-;��i�e@0�"uku@1s����@@2�a�7nq@4z�	�@6^2=h@7�q��~@9Z��n�@;���v@<�?��9�@>�S��B,@@8�$�,@A(��_�@B'��ި@C��hf.@D�
�Й@E��&�@F~�3U@G+�`��@H<=�X�@IQAJ~�n@Jj�!�&@K�=��a�@L�౳1@M���?�@N�9���@P3�J�@P�K�<�L@QH^�Q@Q�dq�}�@R�Yx�@S%6%ݖ1@S��u_)@Tl�D�)@U��v@U�W�b�@Vem9@WHb=^/@W����@Xn9�ܽ@YCS|��@Y��Zm@Z�a/3e8@[<j��;�@[��&t�        ?�<w���1?�@-O?ʖ�0?��y�`�?�\(�Ŝ�?��!s=S?�h��|�?��3���?�[,,��@ W���@.��.E$@�b2��D@
%Xc��`@��!��@ �~�l@ �C�Y�@Z�����@��D`��@u�47@��y�-3@>�i��@ �}~A�>@"_�y�O@#����V@%M�if��@&�.�r�@(g�l�9G@*쎕d�@+��U�Zi@-^�}/��@/f��@0q&Hc@1Y^�.�@2F�#�[�@38��^-@4/�կ�z@5+��*S@6,y􄰿@71�7�@8;��R%@9J>X%�>@:]HJV��@;tʭ�P @<����N�@=�&���@>ը�hv@?���E�@@��/���@A.�!L��@A�K��e^@Bf 6�\@Cυȣ@C������@DH�ZTq�@D�ܛg={@E��P��j@F=�A���@F�_��@G����0@HD~��T@H�I���@I� S6�K@J\�����        ?���L�g?�ß�.�?�,���N?۷$2D=u?�����?��[D��A?����9�?���V�=�@ �Z,��@����I�@f����@�\��U�@�C�ͼ�@N�َ�@���@cr���@~)FU�@�Y�\@�D�0�@!��Jyʼ@##G�Z�@$�U"4S@&�����@(K�F��@* Ym9�@,��[�@-�G&��@/�P���@0�?>P1@2�ܻ�A@3jT�y�@4,!`��@5H�t+N}@6kR=�ݜ@7�����@8���>�@9�
9���@;.�I�,@<lc�$ӎ@=�}5t@>�����@@@#�Ǭ
@@�%D�;@AyDn
R�@B'�팡@B������@C�uhA]e@DB\�+Ī@D���AY�@E�D8�!@Fr7��U@G1v���@G���4v�@H�����h@I|�6c��@JD�^�@KF�9�@K�����@L�r�4_�@M{9�Cy@NN�֕]@O#&�c�@O�瘨        ?�ɥ{6�?�����`f?��R#.*?���u���?�V:GO�?�F�/s��?���
�?�?� :�@ �[;��@�؆�m@�0H2v@7b-�@ڦQ,S`@Y*J�}@��,rT$@�KI���@�(�@�yP��@ �A7�1�@"�I
o=�@$d3���@&0F��@(Vj�,�@)�k�o�>@+�!���@-�?(S� @0�LMK@1!zХ{@2=�`���@3a�9V�@4��f^@5�ݬ�ʫ@6���<�@87=P���@9~z(�h�@:̦C��r@<!���*-@=}����t@>��=��@@$����@@ܧ��x@A�艷_�@BVm��@C-ö�`@C�$bg�t@D�K/ْd@Ep�� Q�@F?ϬT�@G�\�M�@G�X�K�@H�!ݯ@I�����@Ju��>@KV��]��@L; �$�@M"��@N6�IE@N�ST<%z@O�l�7"@@Pn?ɨ�4@P�D���W@Qe�C���@Q��0#        ?�ˣ.�s�?�9aV2?ݗ>V�J�?�a�,��%?�\�����?�_:+$F-@W{B��@��I���@�t�,i�@ ^mMF@����@R�<4l@c8�6@ �[�dF@## hxgu@%��@��@(*8i�@*�&�{7@-r�cP�@0'\Q[��@1��R��@3,l"[G@4��YA�@6f�ltA@8��"��@9�D��@y@;�o u�@=v���@?X�Au�_@@����vz@A�jC%i�@B��}� @C�ʥ�@D�	1Q[@EѺ�E@F�R�m�@H��m1@I1��)�8@J\�6f��@K����e@L��Y_Ӗ@M�
�[�=@O>sT-`]@PBV�2(@P�j%e��@Q�W�@R9��l-�@R��.��@S�'�[�@THa��~@T�R�v�@U�f�@Vl�u��@W'��97@W�n�j�>@X���۲�@Yh9m��@Z,���@Z�g��F@[�qu�f�@\�C �j@]V���`@^'�ٕi        ?�8=_KC4?�4�ì�?ʉ��B�D?ֿi����?�Wf�~?�7�?�h�g�I?� ֜im�?�c���-@ /�z@;:��_�@���@
>�g��@{��@�f�r@;����@zڛhXZ@Ԭ
50�@G�t}��@��ki�q@xv�U�@!	���v@"���$��@#��h�$�@%x�v�� @'@;���@(�p�x@*;ZdH�@+��ͯ^a@-��hI�@/]�Ɖ.@0����8�@1}��1b@2m$�g�@3a=�/�@4Z/�vV@5W��|wx@6ZfoJ��@7a��$O�@8mY�ois@9}�n'��@:��W��@;�"ƍ��@<�qa 4@=�v�.ì@?D���#@@:R�X@@����J@AP�BYZ@A��l�2�@B�1)�A2@C+��
߽@C��� [@Drg���n@E�r#�@E��╊'@FlI*��@G �#�\@Gǿ���u@Hx���k�@I+F��	@I�	�0��@J�ǵ5�g        ?�!�;ځ�?����R�}?Л˩�?�r����d?孻�Yb?�Nc
 ?���}�?�h��Z�@ ~D�E�o@�K��@
����@HzB�On@i�@x@��.���@`�ઌ�@-�!@��ȩ�@׊Id��@ u�.;��@"����@#�M08�@%q��j =@'9a�3s@);��@*���.@,�0��V@.�N���	@0z��	@1��h@2��{��@3�J�	��@4�=6�R@6���>g@72Oɭw9@8gA�F��@9�Z;	��@:ピ�f�@<*���d�@=w��F4=@>ʘ%/@@���@@�����G@Ar�̘RX@B'�g%@B��<)�@C�#��o@DU�9��@Es����@E׉:��@F�4k:dp@GcoY�E@H-4�kb2@H��t��B@I�Mwu[�@J���H�K@KmV�t�@LC���8(@M#���@M�'�9�@Nԏ&�d�@O�U z?T@PK;B㟬@P�xr�}�        ?��蟢U?�i,*�a0?�	Ps�n?ۃ�S��V?��4��YF?��4:ď?��|����?���0X	�?������@�p�U��@V�R�oq@wTȊOw@�n��p�@K
C\�@�*)F�@g�F�G@(�xKV�@
��@ 0X��J@!��J�x@#6�oS�3@$啴@�b@&�O��q-@(o��9�@*J)o,S@,2�)�(@.)zy��X@0�W�@1�J�Z�@2/���Q�@3E�f=�@4b��TĜ@5���#qe@6�[1,~ @7�94"+@9M�2�,@:Q��Y��@;��C���@<����W@>**�ǁ�@?~$�ϐ@@k�Vm��@A�v���@A��ưw}@B�(��V�@C;l�z@C��+���@D��ߵc�@Er�iP�.@F5ƩSE@F��'�t@G�e��@H�K&�y�@IW�	���@J&_쮅�@J��7@K��&/%�@L��K�)M@Mx�5��@NSbSx:�@O0�H��@P���@Px_���        ?����ݛ?�N��%2�?��_���?�s���S?���G7?��q�k�@}4nU;@�e4��@�.-��q@*-��@���#o@����6h@��蚈�@!�/m?�@#X{
��@@%ȁ�:��@(W3|�5@+���1L@-�w�7��@0Y�[n��@1��Z���@3ijw�i@5`�U�@6�s;łH@8di�]��@:'�+�u@;�8��5�@=Ѵ�� i@?�[�j��@@փ�6�@A�G���@B��f)�@C�Q�4�@D�r��@F8�U@G+�Y��l@HMr�w!@It����@J��%+��@Kӥ^Y[?@M��@NGʂ���@O���H#@PhqyC��@Q���@Q�T�5?@Rb��^#@SkYy�@S����}@Ts�C7�}@U(�S]\�@U૧���@V�榡��@WW����Y@X�n�v@X�'t*��@Y�
�0��@ZbO 0#�@[*��y�@[���-�R@\�6��_@]��9&@^d�n�f        ?���`_F?�$ ��k?�x��k��?ֱ ����?�LB5�e�?�pM7�W�?�]W���?�\g���?�K��Fg�@ ���@"��ǟE@|Vh��t@
�6�@����@�ή��E@�}<�@7��3�
@����V�@�m,�͢@Y�0	@�^.~��@ �.��1�@"�$�'@#��G]�@$�5#sz�@&m)�i@'��c=�@){P{p�@+&��p@,��<l�@.T�c��n@0�̦@0���>��@1��cF@2�>�{�@3�8�	�@4vi�s�@5f�_UZe@6ZzK=�@7R>E�6@8M���,�@9L�3�l@:O�=��}@;Vdl�X@<`|�i�*@=n2q)�@>@�D@?��12@@U��D@@�k�@Ar��-��@Bۅ�~@B�����@@C*���+�@C�۰�o@DXV� U�@D�c��|�@E�����>@F("m�1�@F���dOL@Gd󎟾�@H�G���@H���z:        ?�-/���?�7vP��?Ϩuy.�?���8?䧲K�?�*���"�?����?�Ri{�?�YE Pg@	�@�|����@
��h�@��dR@��\�@/�^�@�8���/@T͝۲�@����@�a�z�@ �^~�a@"|�\ʗI@$��l@%�G�X�J@'f3����@)"}bh7@*��6�^@,�0�i8@.�,��k@0EUZ�2�@1@�"�@2A��\!�@3HE��K@4T9�oy@5e�|-�@6|&���@7���V@8���k�@9�7�X��@;
x�9�9@<:��r�@=o�_�A@>�'�Yjh@?�/r9uy@@���Ԭ�@A:�V���@A����-@B���\��@C5�qK�@C㥮��@D���d��@EE�D=6@E�<˧�+@F��^:DJ@Gi����b@H$��<"O@H���t�@I�E�X�f@Jb��B�@K&X^���@K�����@L�թ|�_@M}�(��v@NI�(m��        ?��'�4�?�`�Dn?�	��?/�?ۅ� �?����67�?���:̞?��D�,?��ڡb>�?��m.t�@p�8b@:�n@N(�0�f@�H!>z�@$�����@�7%��@(܏>@�wB���@�m%e�@�1&^�@!Q�EM�@"��*��@$�#�J�@&5>.`��@'����@)���z@+�ijޑ�@-tMw!�S@/c��Y;@0����/z@1�As��@2���:Q�@3�T%;Q3@4�o`�+@5�T�2Ð@7�����@8B��h��@9n,�1}@:�y%s�@;�O"�_p@=��?�%@>Q����@?���d��@@qw7�p�@A��-�@A�EU��H@Bqm����@C!2��=@C��	V@D����i@E>p5ǌ_@E�����@F�-g��@Gq��A@H1"*�g@H��\�P@I�_G��@J~놖bz@KG�L(�P@LP�7@L�e/i 0@M����@N�f/�Us@OU	���C        ?��&�@ ?���4oQ�?�w��F?�C�4}G�?�B��Hz?�7x���@:�U��@vP�F��@Jki�N�@�j{�@P��e�@����h@D�k@ ���+s@"����@%/�y�M@'��5��V@*-}7�G@,���:R@/�p�"�,@13�؝U@2���",�@4-s�Y�@5�r���@7S��� @8�hK@:������@<\�z��@>_���@?�,4��[@@�����@A�4\��@Běǭu�@C��`�@D�3���o@E�=X`�9@Fí�U�
@G�s��ū@H݀!�-O@I���x�@K0eU2�@L#��Y��@MCO���\@Nf�'Y�v@O�s�0�0@P\�^ټj@P��_�0@Q�/��@R)�c�B"@R���f��@Sf���@T�N��@T���?@UNg�W@U��I�GA@V����ÿ@WF�1�h�@W����7@X�&o��@YM��;�@Y�rX�o�@Z��@=�@[dB�9S        ?�B��b?�R�޴?�g6'|#?�w�A�am?�߁qϺ?�;%�˙2?��s'Et?��e�3y?�r�D��@ ���َ�@��<��@4/�7�8@
���?L@�1���@�Kt�4�@��%C�e@�}^�@�@cP�K��@�mSF)@z��E)@ �ޅp@!y���	�@"�#��"j@$c�� ��@%��-Y,K@'z����@)ڑa��@*��о�>@,ktȡ�@.%h�Qj�@/�@�R
�@0�jx�g�@1� W'6@2�O�LT@3�E�Ő�@4��*��2@5��S�*a@6�i��k@7�W%��k@8����@9�6N��@:�S:z@;�+y)t@=q��p�@>0�k�@?UY`k@@>��~t�@@�4允_@Amrhj&@B��W�@B����h@CAʲ�aV@C��"@D�{���@E'>K�9@Ĕ�<�A@Fs�4[G�@G���m�@G�s��1�@Hs�2ϼN@I"u
zf@I��Τ�.@J�c��        ?��\Me��?�Y�,C�?�x�Bʜ?�8`e]g?偏G7�?�bE��?�Y���?�4�@X��@ ^W���@�Z&7�@݊'��@�T�@KC���@�W�el@;:�(�3@��`��7@��s���@�M3'�@ [)�s��@!��v�;@#�7痿�@%P�t0�@'�X�>@(�0g�@*˨��v@,��W�@.����+ @0b��h�G@1o!y]@2�.1�D@3��շ��@4��ֆ3@5���u�@7 ��F@8@�U��;@9x����@:�A)hV@;�W�Ҫ@=E#�6�@>����x�@?��e=t@@���!�;@AQ�k@BrB��@B��|x�@Cqk��WN@D+ëZ�@D�BY*�@E���H�@Fi�ZlȺ@G.,|7r�@G��wh@H���`W@I��}��@JWf	�_�@K'��g�;@K���@L�١�"@M��Ƃ�'@N%�8ƌ@OZ��hэ@P$�p��@P�=pm�        ?��{�Į?�s���?В?6��!?�k��}�o?��bG��?����b?�����?�mh��P@ ��R�p@!�TZK@�9��@S���~@p 
���@۟@kZǵ"o@;�D��@�^=8x#@��1�bJ@ ������@"0m�+B@#�kH�@%��y`[�@'K�u&N@)#�?1�\@+
���P�@,�·��@/МXCG@0�йP�]@1����P�@2�ا�)A@3�Ff��;@4�0��@6}��iS@7G�ND�@8|��3�F@9��}t�g@:�����@<B��?�&@=�M.�7�@>���F @@q�c��@@�Π�� @A�ڗ��@B4�]�ʟ@B�E��h@C�n?c/�@Dc39�`@E"� @�	@E�pi�8@F�א'6�@Go���@H9�u��@Iʿe y@I��R���@J�f����@Kv5�A��@LKQ��@@M"�x��[@M�T?�d�@N�,��)p@O�4��@PK2���@P�Z?e��        ?�� _~�?�v����?��u%�?鴆�+�?��
H�?��2�4n@�����o@��8X�@�7?O��@;��@�+ �@�V��Dv@�$_��@!"��{@#bI� z�@%ф�\�@(^��-L�@+	�y
��@-Т��@0Y�fz>@1آ���7@3d�U���@4����*@6�45��@8U ��@:����@;ܠ\z��@=��y��w@?��� ,@@�7��L@A������@B�}����@C����w�@D�!�F�@Eݭ2f@F�^�Q��@HՆ0@I-�Sk<�@JRd|}��@K{ٕS3_@L�.|�@M�#�f�@O��@�@P(�n	b@P�#�o�0@Qk�I��@R�R{�@R�6%���@Sa��U%�@TP�u�@T�m_��@Uk[��@V���/@V�'�2��@W�M��@X?yK`�@X����@Y��i`Y�@Zs���)�@[3���Y�@[�����@\��B��@]G�?�b        ?�� �%0&?����#�0?��O�︚?��
�Oe6?�G���n�?�������?�J�*}%\?�B=�lǵ?���I�G�@ �A}@=�[��@�N�6D@��k#�u@��{@��?��@/�ʯ��@���@�Ei���@��(��#@0U}��@ wΠ
�@!�*XM@#Z�C\i@@$�7��@&luƬ
@(g�-@)��o�y�@+Y�ܧk�@-��X�@.�3m�7�@0S~+�˟@1@ dgF@21��ϊ@3(�b5@4#��}f@5#��"b@6)$�\�@73X�'?@8AȞ�r@9U'`'�@:m+s��@;�ʟ��@<��o���@=в#N�@>�����@@��:�@@�X9ˋ@AJN}a@A��-Jo@B�+}�@C*\��Q�@Cλ��@Du7p�@E̯���@E�w!��@Fu2OhY�@G#���z�@G��l^zc@H�����@I<h��R@I�0�i�@J���{ԧ@Kf���b�        ?�j��3?��X�!?��hDW�[?��ӕ
W?�_��.�?�8�⺔6?�� �
��?��X�Ss�@ �=+K-u@��E�i@��å�9@�g���@���+b�@9�X�{@��(6�@�1�	«@|��`��@�n���@ ֍ ѭ�@"{��g(G@$1"$��b@%�� �j�@'˿5��@)�d���@+�D��3@-�!��$�@/��胹�@0�p����@2�W
�j@3!�H��v@4G*�-@5s$N�g�@6��6�^6@7�g�qϴ@9s�w�@:e�"���@;��(y�0@=F��@>_߲5s�@?��,�@@�ֆ���@AH��s+�@B��o�@B��ٝ@C} {2@D?|�G@E����@E���S��@F�sVMJ�@Gc쟫�O@H43E̡�@I@�J�@I�5(�?@J����iz@K����R�@Lnì'ŀ@MO[�hq@N2�.��:@Oyd�@@P z���@Pv�$\�@P�ڇA�B@Qd���W        ?� W Z��?�Ὰ�?�/�Yv?�.��@ S?�BL!vm?�v�*<�?��ު�1?�'K�"om@ �\O�n@��d��K@�u���@=4
��@�/���@_<���V@ &�h�@��AR1e@�w^نi@�_J@ �UPjȬ@"�׾�!@$K,��v@&��,�@'���y@)ƿ1b�@+��@-��Bkgq@/�@�R@0�D���B@2��-3@3�F#2�@4A	�M@5h�B(V@6���8�@7�s�I@9,ƣi�@:EAő�@;�(��}<@<���v*u@>(��8;@?~�j���@@m�B�ǉ@A��=i@A����@B�R@~�@CA*@�@C���h�@D��`�)e@E{*۱]�@F><�l@G�_8K@G���V�@H�U��}4@IcDI��@J2�x�/H@K\R�[�@K�|��rT@L������@M��%.�@Nb�my3�@O@sC*�@P��P�@P����@P�B��O        ?���;9�7?͉=�l�Q?�.�W�?��7�ȧ?�X�=|>?�����s�@EJ����@����Q@ ��H@�9T�@��U���@����A@�WB5Z@!���j�@$E�"�@&�wbZ�B@)6z� u-@+�u��j@.ӢЈ�@0�aַ�@2qfUá�@4	ä��@5�v~׋�@7b=-ڝ@9!����@:�v�'�@<ƾa!)�@>����e�@@NEu�Â@AL����@BP�/���@C[ �C��@Djʁ^.@E�=�ڀ@F�J�wa�@G�����@H��M��@JyX�h�@K>[ҥ��@Lt�!Dh@M��)�p@N�2��@PN����@P���!@Qh�OȂ@RkRVٱ@R�|k6n@Sp���2@T"
�X@T�~~��S@U�_?�|@VF�����@WV�#|@W�e):�)@X����U�@YC�~��?@Z�j��d@Z�8�Y@[��͜�@\e��F��@]3��]�@^$�!�@^ֱ"Ӭ�        ?�쯌�ғ?����k�@?��w���C?��zA�?�@D:��?�����?�?�So?�0z���?��T��j @ �- 3;�@&6��a@�]���8@tcq��@v5d�}�@���0@߽���@h	�L4�@׷:gTL@a;���@�`��@ _�N��E@!�g#�U@#>��9��@$��$�@&Lj��E�@'��@�h@)�m&
}F@+3�<��*@,�{$[�@.�� =�@0=!ɢz�@1(v�.�@2��rp@3	v b@4'����@5���@6
�5VI�@7"�.�)@8 *�{�@91�R.	�@:H��=�@;b�?��@<���`B@=������@>͵��@?�I�A�@@�h��M�@A/�*M�@A�i�@Bk1��2@C��
J�@C���oX@DS�� �@D����o	@E��C@@FNu_'H@F�^V���@G�?ۆ@H[�_+9@Iخx�@Iz}�)@Jy%u���@K1�}�$        ?���Ո�?�z�>�s�?�NMqC��?ݤR+���?�L���?���qg?�^�:JL<?���s�Y�@/\��@����w@	��k@w��s2@�`�@���6�@F�5h@�y&�@M����@rh#�@!'��sg@"�j�O@$�O��@&[${&�@(6�$�F�@*!i_��b@,F���@.#��C�@0�p�/@108�1�@2I�t��@3j{M9UR@4�ԧ�	I@5��4�@6�w&��@8/����P@9q���
@:����@<��T@=[+N&+@>�tf�R�@@
�� 3�@@��sDS@As�91�@B,ԛ�e@B�a�T�@C����@Dhc,s:@E,r�]�+@E�:<��G@F����@G��yE�@HW�J9@I(��n�@I��MG��@J�Ux��\@K�T�[-B@L��<�y�@Me�z�c�@NF@��sL@O)"!��&@P6�Ľ@P{�73+@P����@QfF��^]        ?�(�t»"?�2���	?���G��?�]��m�?�eCT2D-?僚2�7k?�3{��[�?�L��f��@�\N�@�$p6�@�[��@:x9V�@����4@r�@���A@�H��4@� �@�@�21��@ �َEU@"��Π�*@$^�C;�@&$�9�z@'�9��.@)��B3@+��p�V@-�
���@/釨@��@1�|�ĝ@2���@39Rڸ�@4]�"��@5�P�3oo@6�W��@�@7��d�l@93�\�@:x�F��@;���-�H@=%B�M@>oض���@?�Κ�z@@��m`F]@AO�v�r�@Bf�B�<@B�0�N�
@C���O@DD���f@E	�� }c@Eэ
���@F�_MoJ�@Gj(��~@H:���@I�{Ə8@I�+d�~@J��\�@K�IH�@LzcRx�b@M\��T�j@NA���)@O)t�u;T@P
���d@P�Ԃؤ�@P���/đ@Qr��_��        ?��g��J?͚�F{D?�*N���?�};?�_����?��p��@Kw�9u�@����{�@FY.@������@�-�j�@����$@�S�>p7@!��t�@$�!�4@&�7�I�\@)H����@,Y��v�@.�w�e@0�sI��@2�^��]@4!<�1K@5�č��@7�����@9E�A���@;�]�?@<�{��C�@>޳!3�U@@j�����@Ak�Ɖ��@Bs=F�/@C�p��a�@D�v���	@E�<v�@Fʯ�E)@G��)�_�@I\k	�@JGt�#ʨ@K{�ǭ4�@L��:�:
@M�"�(�@O9�m%�@PA����+@P�6�b @Q�E_��G@R?��Y#R@R�+�FK@S��r��@TT�^��K@Ui����@U�v�,��@V�,͖@W=�'~�@W���A@X�ǁY}�@Y��q�j�@ZM'��V@[Ԃ��@[��N��~@\�I�*	@]����NR@^TO̚��@_)HZ<l        ?��/��u?��J�ܦ�?��ď�>�?���{(?�au��?��1�r+?�쯼�?�SN���Y?�����,@ 2#�^�@T�1�8�@��pbv@
I����@J�϶�@z�8��@$����@Uٹ8F@���@�l�S:6@pL����@��T��@ ��U�L@"#*k���@#���&�@$�	Vc��@&d/3��U@'�0,�l@)f�C�@*���٨@,�}+%�@.*!�켥@/��[Z�@0�����'@1����@2y�?��@3\����@4C;'+�@5-E�Ax�@6�j@7^̲a�@84O`��@8��m��@9�4r(|I@:�F�/�@;��v�\=@<�Qɕ��@>4�gE�@?G�;z@@@��-�@@�l'8�Z@A$"n��.@A�`0�F@B>!�g��@B�cG�(�@C^!�[@C�W�1S�@D�#�S@E"_j��@E��CE�g@FG�F�sL@F��|7@G{�A�?D@H	o�        ?�ײ���?��go$j?Ќ�W�'�?�Ys��?噟��N)?���?�nS���?�M^h䝻@ l7�]�@�e8;;@�z�7@#�+V�@R[�;	@�9�1RV@?^�/,@����ۑ@��&%�@����Xj@ W��Yz@!���=m.@#��c#�@%G�E��F@'ih+�@(�(WCY@*���7�@,�1��h/@.��NB]@0Y�5:�@1en��S�@2x[r��@3�*���?@4�Ϯ"X@5�ߨ�o@7I#�U�@85��Ǥ�@9n���P^@:��̐Z@;�K���@=>���I�@>��v��@?�X�&��@@�R��y@AS���*@Bn�J4@B�؍��M@Cz$���h@D7L�R[G@D�L7�I@E��f��@F��#��@GH+��Z@HZȮ��@H�F��)@I��͝#�@J�<���@K[9�P�6@L3�YX��@M-�@M����@N�kگܢ@O�m��@PJ�����@P����        ?�(I��D?��[D���?��w�p?ۢ뗎�?��Ge��?�ƳR,7�?�����F?��A��W�@ ssb]v@�{�Xc@Y^��q@tn7
?@�,�)WO@A(5(��@�^`��*@P�>G@	}����@ᶒ�@ذs� ?@!v�zH��@#��s�@$���iv@&m�e�3S@(1K��A@*�=��@+��*��@-͔O�l�@/Ư$�p�@0�Rc?X0@1��e?@2�1���@4�J��@50���zg@6Rp"��%@7z�1�@8����@9��Iw�<@;����@<R�*b�@=�?$W&@>����}�@@���@@��f3@Ao�,���@B`�9��@B�����@C�и���@D>r�Y}9@D��!��@E�qV>�@Ft��+ �@G6�q�H|@G��q��J@H�����@I�$F���@JV���@K%����@K���G�@Lȱ�aA�@M���|�@Nu��ݖ}@OO�9���@P1�        ?��b:ʍ?�Z��	�?��4]w�?阦�8�?�n�a�?�����{@rSp��@����g@�!���@��.�@�8�H�@F�K���@F�O��@ ���� @"��aD�@%T%���l@'�1wx�@*R�B��@,�~���@/� �W��@1DT v��@2��'$�@4:�SCWs@5�'b!Z@7\#:D;�@8�^0�Z�@:��� �@<Z�/�@>S�A\�@?�oP��h@@������@Aĩ��qo@B��G��@C�����@D��9d�@E��'��@F�Zi�k@G�Hq86@H�Ō�T@IƒO;k�@J�[�`�5@K�<��@M
��yA:@N)��v@OK8ý��@P8��M_@P�K��k�@Qc���@Q�1��fu@R�K�s�@S2"8jgl@SϲN�p�@Tn���t�@U��X�@U��Il@VV�M�� @V��߫"�@W�_#�p@XM� 1a-@X�h�� @Y���9�@ZR��5��@[�%��        ?��*���?��KŨe?��6H�V?��2�3L?��R�]�?�ftFm?���f<��?�	�l_�?����(@�p�L@@���R�@��
�$@�wV�@T�ܥN�@�m���@ԓ��@>t��w�@�;�� @b$d9�@z���N@ ��	|@"jx��@#��,��P@%w�ӹx@'gf�@(���i�@*^Un���@,�x�nK@-�O���&@/���Ap�@0�
��@1���b�@2���-�(@3��C��G@4�>���@5��ש�@6�Z�Ȍ@7��<�s@8η��h@9����o�@;�H��a@<"3�|@=F�ЮSf@>o���@?�6�*�:@@gt��ړ@AkC�r@A�y�o�9@B>��0��@B��Z��$@C����K�@D(55�g(@D�iS���@Ex���qI@F#��,�@Fо����@G���!@H0���@H�?��o�@I��T�	�@JN4ys@Kk���+@K�qzV�        ?�~��b�7?�+Ge
�?��>Y@��?��}ٸ?�1Ml���?�Z#D4m?��#��y?��T1�@ ���Ph�@�?Rr`@�v.鸫@��x���@��sC@B��,@�d�b��@��,��@�}���@�d�6�_@ ��D��@"z0�E@$-b�[�@%�OIٶ�@'Fþ@)��`q@+�![��@-�����@/�U�pr@0ݰS�%@1�Q�&�"@3�6{T@40���@5Y"��I@6���y{/@7��n�1@8�,�'�D@:>	=r@;�#�O�@<�w��Er@>+���@?�xe� �@@t��ȁ@A(?*�]@A��Zddf@B���p�\@CU0�m�@Dy��B�@Dֹ#i@E��m��@Fc�<�&�@G.H��@G��דV�@H��S�'�@I��$ɹ�@Js�ὄ�@KL�z�@L&�!T<�@M)���4@M��H�@NƎG5�^@O��M��d@PI���@P���(d@Q4׾�y        ?�核)�?����i?���Cl�P?�	���??�"�q���?�E�{.�?���5��?��%R��*@ Ѽ�CK&@~�S���@|�,#@�N�Ω@���;%$@!%�~@�FHf��@k�GA��@D �=�@<�Ya�@ ��9Z�@"F�8C{�@#�=a�<@%��iҦ@'u��� �@)MNkg�@+3+n�l@-'���@/(чe��@0�(�;�@1�~��@2�����@3�]�@4��_�@6%|�&6~@7T$�/W�@8���e|@9��x�@;�V�@<K���?�@=���_@>�EG�$,@@!�#3�@@�����@A���dh�@B7�˄��@B�����@C�Jz]� @DfHAp@E%�����@E�`� r@F�n���@Gu!4f��@H?q�c�=@IY9^�@I��r���@J�ԫ�M'@K�\�*@LY_��&@M2��!�@N�/�jR@N�	�A[�@Oͷ$wC`@PX`��@P�C\�e        ?�,_���?�Qϧ y�?���d�$�?�`l��(�?�����?��S�v[l@�־�o�@	q�~@ƙT`6w@]u�ق�@$@!�G�@4�1n�\@�w$�"@"Ϥ�y@$��W��@'���w@)�~�X*@,��=�@/r%�+�@1;b~�@2�v�@4h���U)@6���@7��nD�@9�)��k�@;_����@=<�6�@?$|��o@@�T]��@A�2u�@B���o�S@C��N�w@D��0*FR@E���ɶ>@F�k{
e�@H T�#�r@I&�ǓA@JQ޲� L@K�[�gP@L��A��@M�q�C�9@O1����@P;$�A/@Pߺ�Kw@Q���bN@R0 ��":@Rۢ|
D@S����]�@T9����]@T�1�m@@U�ٮ>OY@VW���χ@W��)`@W�ߒ3�@X�'�q�@YH�+�@Z
����@Z͈���[@[��t�>@\Z����8@]$K��@�@]����`�@^�l�H�u        ?���|rcr?�5�>?́9�0/]?�E"�?�>�)E�?�+��A?�.5�N�?�cI�Q�?�/�}q�1@��-x�@;���i�@�x<��@�2�3@�h�V�W@� +��@&K� ��@�
���@+�U�e�@�2h@��,�=@@!>G��%�@"���E�'@$C+==b@%׶ˬ@Y@'w���p!@)#�o��@*ڪ��Z{@,��qBϕ@.iua��@0 pB�@1^[��@2p��@3���G�@4�L�e@5��)yY@6��
V�@7 OR߼�@83�cs�g@9K��6�@:hp���/@;��Z�t�@<�I��h@=�Y c��@?�5M��@@8�6�@@�����7@AV7�;�@A�В���@B�p��T�@C;[E��@C�/a��@D�>S�x�@E1��>[@E�)n��@F�wE%�@G9�����@G����@H�|J���@IR S}z�@J�����@J��%31�@Kz�B$�M@L6Uz�kn        ?��$P�?��X)�=?�e\�p?�̛���B?洪��j?�	9W���?�y�fx$B?��9�9��@B��
$w@	�-���@	%<��7b@��8L�5@&YN�2@���d�@R0����@Xx?�@UM;��@@�\@!(#e��@"�R
G!�@$�R�D��@&RҔP�g@(*��%�>@*�-k�@,V\̱@.	�L�@0ً��@1����~@24Z�GU�@3Q�K��@4u�Z��@5�@k��@6�(�?�q@8^��C�@9E�X��@:�Q7F�@;��-�� @="b#�/@>w�T=+�@?���u@@��ϛ�@AM8��8@BP�M�@B�.��L|@Cw�U[��@D6# 5��@D�,f�S�@E���<��@F�=��C�@GJ:�i	�@HԣW�@H�^��@I�ːp�@J� )c*~@K^ �<�@L6j�h#@MZ�p��@M��#Y�W@N��¯�@O�.w>w@PK����@P��`�*A@Q3�ʿ��        ?��h�+?�
3�,m�?����g��?��@Y)*?�`�&��?�A�1i�?���="?��'ɋc@ Գ��_f@��,
�@��xt��@ڋ��D�@�c�]��@37:!@�cc�d#@�H�#�@k툴!Z@n��3�@ �"����@"k=�9��@$<i��@%�ͣ�&@'��U%�@)�{Jy*@+~
d�x@-{�Ө@/�Jz�s@0��P�o@1�@��@2��K8��@4f��@5Fr#$V@6t!{_�@7��Zjq^@8�l�ȶ@:$~���P@;k�L��/@<�6.@>g��x@?e�-�/k@@bp��V�@A�=Vw�@A�U�l2@B��|��l@C=��ҹ@C���zYA@D�0
q�@E��a��@FE��u�.@G��n@G�*G	g@H�5�J�R@Ix��e�@JLW1ڀ�@K"C�'F�@K��)�z`@Lմ��.}@M�-��@N�ȣy@Ou}]��@P-#N�Z�@P��ĸ1@Q|����        ?�gj���S?λ?� �?�/B����?��*�wH�?�+<9�FC?�����&@����s@	��r��@����2@�.2�_@=A�d@�ڈz7�@ ����7@"_��{id@$�Wф�@'v�9�@*1�0�J�@-,��}�@0l=��U@1�n�W�@3&��9��@4��55��@6��k�Q@8ED��@:;���@;�(�K~@=؏�im@?�5�@�@@���g6@A�'�r��@B�,�e\�@D
�)@E"8��"m@F?ߧl�@Ga`�k)@H�<XMT@I����"6@J�+4�X@LzY�Mx@M[�� L@N�;w=�@O㈇�	/@P�XɆc@Q?R}R@Q�J��@R�Nؓ�X@SE@��M@S�uj��@T��i,�@U_�n�@VR�n�@V�CkNU�@W�P�R�@XKs��n@Y�RJ�O@Y�ފp�:@Z�"�Wo@[XO_;�@\ {a�Ba@\�}���@]��._!@^��v�[@_TW���        ?��fg��S?��u4��?��E��d�?��^`�?�`w۔?�ɗ�ӑ�?��HMH?�Xa�sG?��`\<�?@ ;��@d��%s@�s��+�@
p�h�=@O�&�*@3�멈�@[s�g��@�)�]@����&@q���@F���h@��4+}�@!5 c�+�@"�F�h0K@$ R?�@%�Z_k��@'*��p�@(Ē{�ST@*i.��@,�|O#�@-ҙ�Vd@/���@0��c6��@1��^���@2�#�~6�@3��M��&@4�N���@5��y��o@6�-�u�@7�I27l�@8�>�A��@9���]c�@:�b5��@;�~�e�{@=A���@>3�ɬ�n@?^�-�7�@@G�`h@@����@A}PQ3�@B��� �@B�y�h#@C_Z�I@DhA���@D����f)@ET�x�w%@F pT2܁@F�Y�$-@G]�Z9d�@HZ����@H�!Z�@Ix�N�g@J0��=]@@J�tN�]�        ?�����?�TW2OC�?�r�Q.`�?�,)\5,?�x&�6��?�Ut=M�"?�Q��~��?�*��� @ X�͞q�@���E3@��h~��@�-�P@@I�}nl@��&�@;2O�@�Š���@��a#�@�����@ a	Y�@!�_�ĕ@#����p@%_~$$DB@'(�M�y@)%��q�@*�n!N��@,�bU��@.�����@0z�u���@1��V�#@2�g�1K�@3���Ly�@4�]L�^�@6�I��@7B��*��@8{Q�	�n@9�(��j�@:�I�RF@<J���C�@=�C�v�@>��.@@(���-@@�I(q2�@A��%��&@BF<�c]@C ����@C�:���@D~X1?�@EA@x���@F����@F�V0v��@G�u� �j@HhER��@I8�*nm�@J�ms<�@J�53t@K��̶�s@L����;@Mr;�3F@NR7P�C@O4��t@P�PƁ@P��7p}�@P���~ۈ        ?�����?�e��K:�?�JF�.x?ݪ�b��?桘3�{U?���	���?�r/�)�+?��i͐�1@EjL
��@�'6�@	7�}1�@�l�k��@<���k@ɚH�@}?�<�:@V�|o�@URb�܊@x&_v��@!_Gz�~�@#���p@$�Ŋ6t�@&�s�5�@(���a��@*�A��q@,��+�%�@.�C�}PY@0j�g @1�ŗ2B�@2�zW��@3Ҡ��@5�Uo�@6<�(��K@7|��G�w@8æv�D�@:��[�@;fP��z@<��)x�@>$* ��c@?��_
 @@~F��:m@A9?�`�@A�jU��@B��J� �@C}'����@DD�@�ܵ@E%��^@Eܡϼ�$@F�<�@G�]��Q@HV�Y��E@I/�>Uc�@JK��%@J��ڭ(�@K��?�@L����;�@M��#XR�@N~�[|�v@Oj�����@P,�& e�@P����@Q�$�@Q����(@Rx7�q        ?����?�t}�
a�?��)���G?��[%�-?�5���?���r���@���2Z�@��N��@��q�o`@;;kL@�/��/�@�},�@�}!��&@!�����@#iK�$@%�͕�F�@(m_V�b/@+@�	@-꿡��9@0j����@1����"@3v(F�*@5�7Z$�@6�W�@8����@:K��!�@<6ae�@=�xp�eq@?�7:��G@@�49j@A�C79V@B�����@DwRR�@E �#[t�@F;-! Y�@G[1���	@H��	c�z@I�I��I�@J�Ck)��@Lɿ�B�@MO�4~�@N�H���@O�)e��@P�4gnJ�@Q:��S��@Q�l�[f�@R�{���W@SE%��T@S�e|$�&@T�5�	��@Uf��;��@V!u6��@V�ڔD/�@W���k[@Xa���3@Y%��с�@Y�±��@Z���Ì�@[���3��@\Q�	�@]!�e�s@]���II@^���T(        ?��,d2:?���G@��?�K�1��A?�b���#?����?T?�$�}�g�?���'ү[?�����?� A����@ q~��Y@���B�V@�K��@
�|��PV@�(!�7�@c¸�,@������@���J,�@1���5�@��J~�@9�A""�@�ؾ��b@!P����@"���y�|@$1�"|�Q@%�����@'>ޖ%.@(�Z�;B#@*v>��b�@,!_��lO@-֓Ɓ��@/��@���@0�Mp���@1�����@2��O��Q@3y`����@4p����@5l��尕@6mN�6R�@7rQ�S�_@8{����I@9���\�@:���A�@;�����@<̣ߋ�@=�]̵�@?1K"�@@� �h�@@��(��@AGp?���@A�۵��s@B|;��j@C��].@C���Z�@DY灖��@D��0沝@E��x��n@FH�蠾q@F�O/?@G�vH_�@HG�:^�@H��J1L@I�W�l�@JV��Ъ        ?���j���?�'7��Z?���o��?�W��%?�-��[�?�V��^�?��W�0c�?�	�J}��@ �Y;�@��Ղ��@�1m<9@������@��2zT@J�M5�&@��ji�@�����p@��S��@���D7@ �nHX�9@"�����@$=<�MN�@&�����@'�Q}���@)�j��=@+��vX7�@-��h�ӊ@/�$́]�@0��y8�@2�V���@3$k��?�@4I
�n%@5t���M@6��B�"�@7ߢ�T�@9�T՞@:e���@;�yx�(�@=5MC �@>]5��@?�f�	ʉ@@��/�@�@AF�fN��@A�$��v@B��Sz)@Cy0g�@D:��|@D��#L��@EŨ)�%@F�`^��@G[ґy��@H*�uB��@H������@I�@�X��@J�W}6"�@K��[�|@L^G����@M=���@Ng�X(0@O;Gb'@O�;h@Ph�h�L�@P�=?�H,@QU	�	�        ?�պ;#�?��V����?�s/@C$�?��(D�%?䎂���?�zM.(l?�s��}_?�8e9�9?�F�����@?��q�@ɜ*DG@
��\�/E@Ŏ��@�	;dW@=ם��@�qR��@r�ᔍ�@<��.3@$�a�@@!3�P�@"��LB�@$FU��Ģ@%��B�5@'�r�6\�@)xW��-H@+Nv��s�@-1�1�G@/!y���h@0��P1C@1�O����@2��1�_@3����@4�=�^�@5�'!<��@7�m�B@8(ָ�na@9Uo�%k@:�l IeI@;��&j@<�9vD,@><�+��@?����@�@@g��(�@A���U�@A���-U(@Bg����@CQV�Zk@C�]VP�@D}.l�e"@E3~6���@E�1�H�@F��0�@Gc��;�@H">���@H�U�}H@I���1ɑ@Jk�(%�@K2�dm"�@K���$@L��p
��@M���y@Nb�]�F�@O3s�J�        ?����h?�S���$?��M���"?�>жd7?��� �A?���� g@�}Zg� @�º]�k@ʙ��?@)�����@��-�ڳ@��P�+?@�E�|D�@ ���!q�@#G[�@�h@%�9�9\�@(8�?l��@*��(�}@-���ߺ@0<E 4�I@1�N�0��@3?Y��j�@4�����@6u[F!��@8"�U��U@9�Oe�8p@;��~��,@=r}���8@?N˧Y��@@�+����@A�{�7@B�A39�
@C�j7e�s@D��0rj�@E���]~�@FÐ �m�@GܡA�u@H�žmH�@J� C�@KF
�o�M@Ls��I�@M��m��I@N��f�@Piu�?�@P�hu��@QM�����@Q�I)��E@R� ��@SB3�9&�@S�}�k�@T��zx��@UJ�'è@U�o�z?@V�`��@Wfn3��e@X���@X��i�@Y�7ƥ�@ZSctM�@[�Ք��@[�
�l@\�X̮t@]`����N        ?�)��?���_;�?�k�wq37?֥��#��?�CV��y�?�b�P�[�?�S�kȊ?���1Y�?�9�)bC�?��vK|D@s ��@k-��@	�>�1�]@�[��˳@�2,-�@���z5'@&�^�
@n�Pȷ^@͈Q�@BÂс�@͸��+H@ �蕷�Y@"@�_(@#u�v@$��Te�@&[�t,S@'�� @)g׹��@*�|��|@,���vL@.;�DS�@/��'uUw@0�b�T�@1�dm�[�@2�r���@3x}Ef;@4cu��T@5RN}t�V@6D�@N�@7;p��p@85��4@93����Z@:5'}�m�@;:_xx��@<C/�Y$�@=O�5^?D@>_u��"w@?r�ʴ��@@D�÷��@@��F�@A`ީjB�@A�l�-@B���L��@C���y@C��F��@DDJȉ��@D�q�s�@Ew����?@F��0�@F����@GPF���@G���n��@H�3q �        ?������?��N���a?��+��?ۘd�t|C?�:Mq
?���T�n?���
`?��F´�?���A�-�@x����@EII��@\�J��@�dY%~@1�Z�>�@�MZ	�@=���w0@����H�@˓j~��@��.a%@!j@�#��@#��nđ@$��8�5q@&^���@(!�dubL@)���@+��S)c]@-��%Re@/�x�y@0�c@�47@1�o2��@2�*��@4�Li�@5 ���cf@6A�R�@7f��az~@8�~^�@9Ù�6�@:�2���3@<65O��@=w�Q�@>�#p�@@�`���@@�aL�}�@AXRb��J@B�D��}@B��0��@Cg����k@D�y�j�@Dӆ�_�<@E��{@FHd��@G3�[P�@G�9['�v@H�l0��@IL���@J;kcg@J���_@K�oln��@Ls"p���@MA��\�@N����@N�bK�n@O� %�"        ?�D��x!?���CP�?�*0�0,?ۼc竏?�'�DVED?���Q2*	?������?�͙!��@ G��d�@���R�@�EL�j�@���ΫH@WBfL�@i$�j�@�6è<@��8(�@O�2@N.@42+D/@ m�8_@!�p?���@#Oҟ�e@% L
��@&�����@(�o	7v�@*i����@,S��v=d@.K�֧�@0(��*B@12hX�@2B��*� @3Yj[��j@4v�ѭ�U@5�<�h~@6��)@7�/�Ü@9*^��@:f���[6@;��D�p�@<���y�@>>����N@?���F"@@u� @A$��u��@A���_�"@B���C	k@CC�>&@C�%�,��@D��[g@Ex���'@F:�s��&@F��Qo��@G�h0���@H�tH�~�@IY�*8� @J'����@J�ؿ��|@K�Nd~C�@L��C21@Mvܕ�?@NOZb��@O*�՗j:@PF����@Pt6��6        ?��T��?˱�]9��?�,;�e��?��JB�?�_N�B�?���;�@~���@@[n�!�@��(�@�	#m�'@!cO;�@�!G��O@Ȅ�f�"@ |~R�F�@"����5@%�Ga@'q���@)��g�@,����@/SX�|{@1���	o@2�6�b�@4;:��D@5�]�T*�@7(\���@8����c�@:s��U�?@<)o$�@=�:J�|�@?��Y�@@���L
@A��S��@B�$$��@C�*���@D����v@E����@F���b.@G����/@H��m�HI@I����w0@J�u�}�@K�lkN�}@M	hz%@N*]r{�@OO@\��@P<+F�@P�R��R@Qj����@R��7�5@R����L�@S>m3��@S���@T�G��@U"�vua�@U��o)z@Vn��p@W3Fw��@W�~�e1�@Xm�� @Y=u�y�@Yʨ%rF@Z{�z�@[.~J\)�        ?�r�tP?�ˬ`��=?�2�_a�?�)&�!}u?�hi؉�	?��!$��z?�eJ�:�o?�aEӥS?��h���@ ��1�@MDfH/@�ꤟ@�}gQP�@�0ؒ��@�x�{�@'�m�f@zXX��@���O�@jM�v�h@J[[�y@ \��.��@!�}�M~�@#1B�G�@$����-�@&0�����@'��\��	@)Y@��(@*�h!���@,�@KI�@._�]1��@0���P@0� ��@1��äC@2ʏse:@3�de���@4���n}@5��UGeU@6���/+�@7�V6��@8�+`I�@9��]k@:�؀��	@;ᗚ�I @<�7��Yd@>�<`*�@?0�A��f@@)tl��c@@�L ���@AP���Z1@A�q��*�@B�����@C��A�@C���@DSB��f@D�<���q@E�'�<9K@F5�Ay��@F����'@G�4�{�@H'v�r>@HО&&�@I{_�V�@J'��i�        ?�WM�[��?���]*�?е'8.'�?ܛ�Q�t�?��o���?���+��%?���|kyb?���"K0;@ �<�5��@.z�v�@0��@[Q{@q�W�Pa@�*̊@e�)<
�@����@↾):@�圅�@ pk�T�`@"QxWzz@#�M#j+@%b��_@'%B	���@(���@�
@*��7^�@,��ڔ�u@.�2)�L?@0b^B�X@1l�!1�@2}C�2�@3�+�&A�@4�B&r�_@5�n��A@6���s�z@8,�D|�@@9a�j�a@:�_՛��@;��z'��@="�]rj�@>n��*��@?���2��@@�3��C$@A9?{ہm@A��l�h�@B�\�'� @CS^Ԯ@D�5�a2@D�!)��@E�Ԣ��=@FEr&�(@G�_i� @G�%{@H��k��@I^��j�@J+�R�@J��ԷH@K�<j"��@L��(�S@Mtǃ�:�@NM�R%-@O'�O���@P7*I�@Pq�ף��        ?�iR�:�?�����D�?�@�J��f?����}��?�@�m�2?�gv��?����?���z+E@ -9���@�򟂩@�@����@�c�l@��^;@u��@���@��N�@]�Y"rj@C)���@ $Tov��@!�Ś>��@#X�����@%	w@R��@&�"�[�.@(�RV��@*sð��@,^6���/@.Vo3���@0.I�`K@17�d��@2G����m@3^EE���@4{*���s@5�Sƾ�~@6ǧ�c�@7�H�[h@9,sߗM�@:g���*�@;�����@<��N>�@><J�Bi@?�lp��@@so@@A!�����@A��`)�@B���'�@C=2�4@C�J�]�D@D�����y@Epw;J@F0�|[�@F���h��@G�omپ@H�_�wN'@IK�����@JWf��z@J�Pb��a@K��ap@L�eM	�@Ma嚗�_@N9�(���@O?_{�@O�~�0d�@Pg��W        ?��-E���?͑}�_V?�i$���?ꭓ�m�-?�V$��m�?��5ޓ�$@<��� "@��]~�'@�	B�0@�˓[m@|�J:�]@lH���@�F��@!���/�@#�53�@&YӔ�t@(�?F�_@+�A�.�@.i���@0��~
��@2'��s�@3������@5Ly7�k@6��Dt�@8��CM��@:\qI5@<#��;�@=���,�Q@?��_&(�@@��;��P@A�c���/@B��͑5@CԽb���@D�Y _�@E��˝�@F�� |@H�K��@I*���mB@JI��!�5@Km�%�@L�����w@M�`��:�@N�^�M��@PW1
^m@P�!�t��@QP����@Q��<�@R�~kJ�@S9+@��z@S�D�_�@T�[�/�@U4i�p��@U�jf�!A@V�W��B@WA+�T�@W�ᦦ��@X�uq��@Y^�2�^@Z!��z�@Z�2!�y@[�X��c@\J���@]
#5��"        ?��B�vU�?�yS�r��?���5'��?��]�R��?�;�ij��?��C?���?�F�s"T?�C����?��b�O@ �è���@Sf��#[@���H�@�u���j@�hw�,�@&��Wn�@u��Lg�@�,b��@mBp��_@�Y3�@�|]�@ ܜ*-�2@"Zm[{@#���F�,@%~o��8�@'$9�M�@(����
\@*�pܫQ_@,b��	��@.;S�v�@0��a�@1����@2�!�H@3�� [@4�Vܙ@5&`wQ�@6<x�b@7XL-Ѱ�@8y��B��@9��?@:ͪ�
z�@;���/�@=7�RqD@>tޅ�i�@?�zv�@@�3WA~@A&]ǭ��@AϤ�=@B{��=�@C*�5��@C�t:xZ@D������@ED��C�@E�^d��@F�y(y{@GvJ#l�@H6$W:@H��SB��@I�`N}��@J��}�#�@KNEr���@LD����@L��ik@M�I��*�        ?��\���?�+j�ן�?�b�޸f�?�.eư?�h�� U�?�A��K�?�ERA�?I?�UqǪQ@ P���@��͘p�@�vUTy�@�n�r@A���ݲ@�r-!�@1G\�!@�2��@�V���@��nNE�@ W����@!�/!���@#�uI��@%P����@'���Q@(�1ķ�"@*�(ơ�@,�ano�@.?���@0hP�W��@1vi�B�@2��::E6@3�}����@4���|@5�2 @7�8�*@8P�3#�`@9�=�i^@:�~@ͬ@<��!m�@=]�� @>�gM���@@m��Z�@@����@�@AcF'�oy@BQ؁b�@B�l�*�@C�x;,t@DC�):@ED�#�@E�Hm�r@F���g��@GM%�푲@H�Z��P@H���<#�@I�WӉ~�@J~:fy@KP{ɚ�@L%kͷ�@L�%��<@M�@ @N��?ٙ�@O�����F@P7Q�-�\@P�z����        ?���t��?�f�]��?�NRa�;#?ݵ>�Z��?櫱��	
?�c]o,S?����U�?����!$)@S���y$@&�
��@	Q\LLJ�@ѣ��
�@R�����@��򶻰@��?;98@��NU�@��4t@���{g@!���R@#:�7�C@%k4�U_@&�1'g��@(����@*�b�Y3�@,�H���@.�a��@0�7D��@1��,T'�@2ܺ�?{�@4{+!�@5A�$�0�@6l���@7�k���@9�B`s!@:c����@;�e�ǭ@=ñf��@>���h\@?�\�N@@�g����@At��bv)@B6��Z�@B�ʒz�@C´��ݬ@D��I@E[��yu�@F-?X�)@G�
7�@G����@H�%��ǩ@I�Zඛ�@Jpt�V�@KSk+_�@L950��k@M!��s�@N)�[8@N�G�<�@O�"v<Hs@Po�e��@P��`܉@QgnnIc@Q�6�=�@RdM���j        ?����0�?͗���Y�?�.w6Ւ�?���X�_?�n%�l�?�鴝z�O@ĕ.az@	j����@O���@+B�~@�S�W�X@��LM@`۞��E@"%�s�@$�3QIm@' ��o`�@)��!��l@,�/�$�@/ɤ���@1w]����@3�e�f@4�=�΁�@6�T��G@8_^�iL@:?���[@<-�\1آ@>+j�CC@@�[J%Y@A(�!Sf@B<Π�z�@CW���C@Dy����@E��?�}U@F�f+��@HE�U�@IE<P,@J�h��=�@K�;�b@M"x"�3�@Ny5w�@O��Z��7@P��Z��@QQ4���@R�$]�@Ró�$ڥ@S�{U���@TB?.C�@U�
���@U̞ע��@V�-
L>�@Wb���?�@X1��=��@YT�LM@Y��K�"@Z���W�@[�0+%շ@\hn1�� @]Hg
w@^+��9@_tC@_�|���@`q��c@`�;�qe        ?������?�v���@?��a���?��
ֵ�C?�/�:��W?����?�0��c�?��[�)?���Z��@ �~��*@1���{@���#�@TETO�%@L�w�%@�VK�L@�@��@=�Zq�p@�O��@!"�q�W@�x�)Z�@ 1U� *@!���#E@"�����@$u`�+m@%�x���@'��ʹ��@)��x@*�R�@,^�dU��@.��mF�@/�P����@0��,�m@1�aZ���@2���6{�@3��f�?@4~��04�@5wK^$4@6t(���@7uN9�x@8z�� �a@9�?��A@:��[aR@;���Z�@<�b�E�@=�ea��@>��ޗ@@	[zt!@@�����@A0��q�@A�v���@B^�F9\�@B��NO��@C�ot8��@D2��`@D�_0���@Er|�q��@F[5�D@F��Hl��@G`J(�"@HR-��@H�	�Q�t@I]l�L��@J
wv7`�        ?�~��X��?�'�_U}�?��{O�x�?�t#Z�?�1�,M?�\��W{9?��L-d?��q�v�@ �ռ���@�^]��X@��`ӈ*@6"���@�Dؙ/�@R�����@�o+��@��J%@�VeWO@���`�@ �IJQ~@"�U�y�@$K�+l��@&��ˎ*@'��-lI~@)���}Y@+��V̂�@-̾?��/@/�mT�]�@1M�P{�@2�J�,@38֤��+@4_�N�P@5�6r��@6�2�@7��f��@9;ԅۥj@:��{w\b@;ћ�~|y@=&�U>�@>�ݣM� @?��PE+@@���k-@A[8k�-@B�ٟ@Bў2�#�@C�L<�	@DS���@@Ey�4��@E��p�k@F�8��t@G{[n�uC@HLM���j@I �J	}@I����[@J���Vb9@K���*(d@L�NL3�,@Mk���Y�@NO��F�@O6eE�=@P�^䅩@P���@Ȣ@P��J�E�@Qu5���x        ?���ɲ�?��T+bA?�e'�M
s?�{6��7?�l�#m3??�B��
E�?�B2eF(�?�5�`�-@ E�H�xG@�rRX�@�ˉ[t�@��ꘃx@$��p�V@����6r@�3��u�@�:k�@_^�_�@?U)i@ .�c�@!��;�P�@#J�e9@$����x�@&����1�@(x^�߉@*M�X>ۮ@,0�@� @. �	F��@0�z�X@1\-m�@2v g�@31��t@4H�s�S�@5fΌ�{@6��Ô��@7��Z'�x@8�`^[�@:�6��@;U<���@<�5��M�@=��.���@?(�%�@@=M>�@@�����@A��P*$@BH F���@B���A�T@C�����@Dja�|DY@E%�H6��@E�Wg�v@F��6���@Gfմ�w@H+�\T�@H�m��.�@I���6@J��^ׇ@KV)nJ�@L&��'�@L�,u���@M���hf&@N��nQ@O}�w�@P,����o        ?��2Ȉ�?�s�p�5D?�o��
?�[c��?�C���?���WǑ_@,W�hN@�Y�$>@�$k{�}@������@j1p�r�@V��ĳ	@��#D�@!{��#8_@#���UL_@&HQ*��@(ڏq��N@+���G@.Q���4@0����S@2>�~
�@3�.��se@5;>�� @6�'�I��@8����@:F���80@<�B��z@=�nR�@?��h�`@@͠5�D@A�gڹ�@B�LOe��@C�;��L@D�%��@E�����R@F�_!A}@G�.&�:q@Iu'Xe@J6w�'@KZ(F8}�@L�vD"
�@M�O�˄@N�J4�@P1]�~X@P�=H��:@QGn/ws@Q��5��@R�"����@S1�97^)@S�Y@T��d��*@U.s��;@Uۚܺ��@V�ݬ@W<k��d�@W���@X���wb @Y\A�y@Z�+�Z@Z�޽���@[����`d@\KRxڙ@][&��'        ?�ļd�0?��a B]c?�){���'?�m؛w��?�n���?�)_�P�;?�.���K�?��b�t��?��dL�^?���,��>@�RW�/@EKu]�s@	��ifЩ@�Yv �@���Ĥ�@�ק<�@|�I�A@[Զ��#@��#d�I@5�}�-@ä���@ ��.f@"'}�i@#x�\��@$�;2�@&f���l�@'��gS/@)|���A�@+?o�6~@,�N�_�@.e�j�S�@0��4�@0��B��@1��(k�3@2�=�+@3��L��@4��=p�@5�D����@6��<v�A@7��HKt^@8��Ҹ�:@9������@:��	�ʓ@;�5m�P@<�����@=�ķd��@>��)��2@@����@@�~\@�~@A&aJ�@A�+��J�@BQ���*@B�h΢.U@C��͈H�@D!nEh@D�51Q�@E_"���@F �\|�
@F�hDܐ�@GI���@G�����@H��j�j�@IDG$�X�        ?��/�b*^?�;�?ճ^?�U���?�3��?�A��!o?�sJ
��?���%�?�"�D�@ ���w��@���V@��[��@��J}d@�)5B8@a�Ͼ��@.��4}@�,��i@���/%@�8�CT@ ���&_@"����u@$^lv��@&'�g	z@(�B.@)��Z�@+�|h�s@-�nm�V@/�Y���#@1}�Q�H@2)dqW�o@3IF�C�B@4pu�S�@5��S%��@6��P�6@8�y)�@9N�����@:��3��[@;�?cL�)@=:C�Q,�@>��4T!�@?�J��@@����t�@Af�0[1�@B ��3�@B�ɞe�E@C��[A�@D`��,�'@E&��;�@E��%�ȇ@F��ߟ��@G�S�z�@H[��@I/�g��|@J��z�@J��Zu�U@K��7�v�@L���@M}���G@Na�rtg�@OH���u�@P �bcC@P���6P�@Q$���+@Q~�����        ?�9C���z?�����S?�i����n?���?���W:�?����u?���S(w�?�4j����?�8%V�#B@i�[0@ V��Q_@	�Sߠ�@�0��{X@0R��ٟ@�M�B+@��
�@~��k��@)�#\X�@��WX�@ i����@!����'�@#u/�ߛ�@%`���[@&�?��7@(f��$@*%	�P��@+�y��"@-ţ,ϝ�@/�Py�#a@0�'�Bk@1�9�xN@2��ȶF�@3ΰ��S�@4��a�4@5�X�F�@7�|3�@8�,k3@9?'\_�6@:d�#x@;����T@<�>��lA@=�"�d��@?*��@j�@@3��7�P@@����_@AwߔL��@B.��@BīZ�Af@CnP����@Da�#�@D��:R�
@Ew��/j@F)���1@F��ע@G��`��@HK�|���@IЎ)��@I�����@J?��d@K>�r(g�@L  	NB@L���@M���;�        ?��un�?˵;K��?�.g�c|]?�e���?�#�\��?���	\p@^ ��8@D(�S��@��;@���_�@*h�#�D@�p�AR(@�We�@ �W���o@"�����@%�G�Ǆ@'�f@*&�� �@,��){ �@/�;)�z@10چ3�@2��ZG�@40����@5�s$M�$@7_��>�[@9���-@:����p�@<zi7
�@>CDg�@@�0}Ҽ@@���q}�@A�Ȃ���@B���%�@C�Au=$@D�f֯�a@E�hn��c@F�7dh��@H��&�@I&�CPk@J@�Hn�@K`��N)@L��;�9�@M�c:�eP@Nڕ�J�	@Pm��M@P�&l���@Q>]y�wo@Qݾ�D�@REg.��@S"터0:@SȲ��@'@Tp�X�?@U��d@Uƈ�Z��@Vt��Ҩ�@W$�L� �@W��%��@X��W;�@YAm`��@Y����@Z�-8�@B@[o0�(6�@\-&�}�,        ?�dW���?��G��A�?�G ���?�;��쿠?�w/��H�?��c��?�s�|�??�s[��u�?�� ޯ@tg��@[FsDk@����o@�_���0@�c��?�@�Ĝ���@,���� @}u7a@����@g�8��+@��$J�@ W?C�^�@!�e؂+)@#&& 9��@$�;\}��@&b�w�,@'�]-�ph@)=�@U�@*���7?@,���v��@.2�2I�@/�է��@0֨��ٳ@1�����Z@2�ǘ��x@3��(@4�=k+|�@5xl!TCx@6q}�GM�@7nb�wI@8o�+Q@9si�M��@:{l��f@@;��\/�@<�0���@=�ۦYk@>��ƀ@?ؕo{�G@@z�q��c@A
��0�@A��ݼb@B0(��@B�1�A��@C[�Ϭ$"@C��J~w@D���K'�@E)9��@E���l��@Fd'�i@G�#�:J@G�2���@HG�;S�o@H�
p�@I��mξ<        ?����k��?���z�D?�S�F_�?ݭb�l?�[+���?���H\?�a�Wd?���?��@.���[@���)k|@	d�sa�@lq���F@*[���@���\�@4
�\��@�����@�PL�4X@��ְ@!�,�Q�@"�����@$m7|8�@&3I���@(�0��@)�ޜ.a�@+��vt��@-�b��'|@/�/��(�@1���t�@2hgQ�*@3:pp=?@4]���h�@5��-�Wj@6�WZ���@7�ͅ�@9-�B\q@:q�C8�@;�B���@=�|0�a@>bA���@?��$bp@@����s@AE����@A�U!��@B����d@Cs�@ [�@D3x���@D�5�B�@E����Wd@F�փ�@GO [��@H���@H�h��@I��s�Q@J�a���:@Kn��z�s@LI����@M'c���M@N~J�UE@N��y�Y@O�6E{~�@P[d��F@P�f+�j�@QF��å�        ?� ,�P�Y?�p0$�V?��	��?ۅX���m?��I+4?��ێ�(?���1��?����6?����� @n��$�8@8-����@K�	<�@��I�&�@#K#��@���q@�@&���$@��k�u�@��=��@�b���/@!P*^g@"��=M�@$�-�9@&4]�L�@'��]���@)��C��@+��{�@-u!���@/eFz�W@0�蔯�]@1�I���}@2���Ҥ�@3��ڵ�@4�Hd�dG@6Q�辶@7$z��Z@8K��/��@9x��(��@:�n�@;�%�U@= ����e@>c:��I@?�5�2]@@|1)܊@A%W����@A�2�v@B6�/��@C/�^�C�@C����@D�}Gf�@EPeGw7x@F
�Ff�G@F�H���a@G�8*��@HGq���@I
��!�@IЩ����@J����o@Kb�n���@L/�� �@L���eP+@M�6R�U@N��3��@Ou��� �        ?�ňd�A�?ͩ��0i?�;}6+�?��v�U=]?�g��
d?��*X"�@K�P�L@��e�>@����v�@�L�˝@�iH�h@q��^�@��H�|@!��	[@#��:�@&RB}@(��ϥa@+�ܸ|�9@.Si^t=@0�?oT��@2-� �@3�'�Q�@50��	y�@6��@�f@8zA�]@:/i���@;�1�~�@=�]�Q>�@?��.��@@����)/@A���L�B@B���f��@C�9Sse�@D�G��@E���N@F�ԉ�Ǎ@G�-M"�@H������@I�M@K
�����@L*ܭ")@MO�U�@Nw@.,�@O�cU֞�@Pi�� =�@Q��V=w@Q�~lȪ�@R=6�T��@R��!U@S~27X�@T!h� �@T�h`�_�@Um+U�O!@V�HpI@V��{e>8@Wkљ�w@Xk7���@XȬ���n@Yy��"�@Z,UAxM@Z�2oWE@[��
+�Q@\M)S$�c        ?��!��?��#�Vd9?�\GR��^?�s&��X|?��X)<V�?�;4��e�?��T���?��0��G-?�� ��W@ {��T��@�����@�K@
�h��@�.�60�@R�n���@r�2&�M@�TX��@��X��w@`�.���@� ����@l7&h�@!T쁵�@"db:��@#��a#��@%8���Ȋ@&���I_@(1���&@)� �R@+L�����@,���4�@.�����@0t��L�@0�:�Ј�@1��|~�@2���Q�{@3�ȱ�4@4z&���o@5e �e�@6SG�A�@7D�f�?�@89��]��@92��Ǖ@:-�Ũ��@;,&�F��@<-�"X�@=2�k*��@>:e�aS7@?E'8��M@@)kif�@@���
�@A;d�p@A�z�#��@BR�/�V@B�G�@Co��G��@D L$9@D���@E%��1�@E�K���@FN���@F�A@G}�%,�@H��        ?�
в�R�?�4�n�?ЋM�n�Z?�U�� g?啻�E��?�{ߒT?�gQ5��?�A¯(�@ c;���a@��Y��@��c�@
�t��b@A��F�@���̭@$�}��@�-�_:�@��\J@r��M��@ ;F*́'@!�I��S`@#l>kD�@%rk�" @&��*�/T@(�l��C�@*y�P�g@,^�[�R�@.Q�Q7._@0(�L�7@@1.�����@2;$�u�@3M�*S@4faE�@5��~�@6���h�@7��Y��@9��T�@:7�CΪ�@;r����@<���܊�@=��udγ@?C��L@@I�g�y�@@����C�@A���)@BQ�F�k�@C0�i�@C����t@DpE&��i@E)�x2�x@E�	jvsd@F�}���@GeKF���@H(l���@H�݉���@I��SRS�@J�qh@KK�X �@LP��O@L���f�@M���x {@N��Y�@@Oj8wa;@P!���]        ?�H�q�?�EH(Ӫ�?��u�n%?�^˜e.�?�ݯ��j?�z���+?�:N��@?�h`�m?�����!@S�o�~�@�u��@&8�|k�@{��{�@0C��|@z8ي@	\٠I�@�c=�?�@�KI�	�@r^N���@!=�p0��@"�88�c�@$r����@&"	&g�@'�"c��g@)��˗�@+��?��@-f��xZn@/XqGع�@0���� @1���@2��gn�@3Λ� B�@4�x ���@6J���q@7( ��+@8Q�����@9��6]�@:��jLφ@;�}��@=0�[�d�@>vl?@-@?����ݥ@@�<�kW@A4	�+\%@A�1�z�@B��b�Q�@CD�<@C����ƾ@D����hG@El ��hG@F(�8�Qk@F��/��G@G��&P�@Hm�Bdsl@I3�(��@I�����@JǸ΍q@K���y�@Ld�+��m@M6�l���@N
�暪�@N����@O�f��        ?�/��<�?̹g��x?�@�h�X?���8D
?��w$�4�?��U��@���_@y"5=@���K<@=:�Z@éMv�@�1�-,q@����e�@ ��c��@#*(l1��@%�G�\��@'����L�@*�/$M+@--ՠ>��@/�n&=�A@1a��X@2��w�@4W�ӯ��@5�t�0��@7y:�Brp@9=Y\�@:�x��@<u��T�6@>2WYaf@?���Z~�@@��dn%9@A΀/X4�@B�C�z@C�/��<9@D�/Vnc@E�/8h {@F�D�1@G����h�@H�~�݄@I�Ӛ�(�@J����H�@K�~/Q[@L���ֻ1@Ny� �H@O+����@P&*��8�@P�+8Ę�@QK�E�L @Q���7D@Rx4OM/@S�@OP�@S��EA0:@TF���@T�0�;@U����.@V!��Ǫ@V�I�@Wf6�z�@X
���#�@X�V�^,�@YW�=�uz@Z @��@Z�	��W+