CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T103601        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
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
          <value>0.125</value>
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
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�婡L��?�XFQ���?�e�6��?�����@q�\]3@�����@V�J�_�@��ڂ<@$R���+�@*B@{;@0E\7rl@3����@8~ж�@<�d���]@@���]@C�֭or�@F�úT!�@I�X�4��@M^5B�}X@P�z�m��@R�)!-�@T� /)�@W4Х�V@Y�O| ��@\g���|@_A,�r@a#&I�y�@b��S;�q@dk.']�@f0�����@h�/hA@jr1��@l�eu!]@n/v��vj@p5��4@q^D��ƪ@r���l�@s��>��P@u"h@��W@v|�+�@w��ՠ�@yT]��C@z��&E��@|]�	�2@}�$�ת�@����T@��H�@���N�@�e{���@�O)�`M/@�>�`�{Q@�4W~��@�/�[���@�1Q��@�8Ÿ�O�@�F9@��]@�Y�ǆ�_@�s4�k��@��ńs @��f�)�@����#�@�
�v0��@���Y/�        ?���:�?+.@R?�[��y?�N��u@��Ǘx@Dl��@��懄4@#J̨��j@+�R����@3$갳��@9�Ɣ�<@@����?@E�͆�|Z@K�8»0@Q&����m@U=�t��@Y��7}U@^�i��B�@bJ��L@eI:�u��@h�tM�@l��\Q�d@py��h@r�k����@uS��8�@xv�6�r@{�����@~1`��b,@��TWF�@�����a@��i���Y@���>��7@��x���@�!5�D�@��G .`@�O/	�&@�s��~�@���ѡ�@�g5��q8@�����-@��BZv!@�gG���p@�;X����@�$����6@�$�CwO=@�����_=@��/���V@�֞P 9<@�Fb@�?�\���@��t��(@����1�y@�9�@���Sn@� ��2O)@����{U]@�;���A@�n��=@�F3@��@�$�K�G@�	��]@���� P@��a�h�        ?�w�)�(?��]?���WN�`?�"�q��-@
@�L�@z�p�+@!������@*~86��@2�m�+�@:-�ф�@A�VU�*4@G(�;;�B@M��HV�@R�#��bl@W��*��:@]���!@a���L��@eKJP�@i\\���F@m� bx�@q�`4{D�@tV��/�@ws���@zݲ�ݶ@~�fT�5�@�Q����@�����[�@��o�{R�@�e1�i��@�fO�@��� <W�@�������@�&힎��@��ų���@���Gκ@���e]w�@���RhJ@��"��@�ߨ��J@�$��4@�D5#��@��8���@�ǈi�+@�c��.�@�xs�<�@��@�z�@�U^
l�G@������@�\�@Z��@��t�"բ@��@���@��\�G�h@�qSz��K@�M�3ra"@�/�h`F@��.�I@���DV�@���b��@�߯E�te@�ևz�Y@�у�c�V@�Д�@�ө��        @�T�J�,@<뭕���@WY�4���@i����?�@w�����@�A�Ɔ��@��U�/@�J;y)�a@�u͠E@���<.@�3�V��@�v����@�6����@��;w��@��G1ͯ@���+D��@�;�2���@���Bv	�@� �m�RL@�-�%Bq@łzl�@�6-R�@ʬ��=@̈́.��&�@�D��V01@�ވ5��@Ӑ4���@�Y���@�;ఒ��@�67l��@�I�@�@�tdѧ�@߸o��,@�
����@�E�n.x�@�#7m�@��Q$�;@�B3
ڂ�@��7�� @�*3�1{@�YQ��l@�EB;�R�@���}ޑp@�V��J@��M�@�2�4��@�t�a�@�dD�@�Z�/k@�X��E$@�[�5˝@�e� �@�v�IÛ@���˜�f@��S*�@�ҋ[n��@���njJ�@�2n�`b@�l����4A WQ�땵A ������A��0p�*AOB��bE        ?�$d��@?��9��g?鯉xc-�?�тz�+<@�D��@�b��5@N�Ff@!�u8A@&@�%蟹@,d ��@1JiY���@4�?(7@8�b��_@=jHGf�@@݉Eg��@CY>�U��@F��G@H�##W�@K�2�44@O���X@Q0�̔�@R�1���5@TՕX��s@V�h� M�@X��;���@[7��k@]E�F��[@_�:�v?�@a
;�}�e@bQ;��ߏ@c�*�w!@e�w��@fsҝ�P�@g�|k>ly@iu�	��@k
-m���@l��/~q@nXW��=@p	���2@p�3U��@q� ��X@r�W@�$�@s�����@t���S@u��Le�}@v�E.�@w˱i\7�@x�A�-��@y���l4�@{3b$�@|=��
��@}h��%�@~����@�#�^@���:�@�(��js@��!|�K�@�t�Ob G@�7���n@���g�X�@�}l{ɄB@�1���@�������        ?�����U?�
٧���?�i�/��?�%��ˬ=?�Ԋ���@����3@���@���<�@#�i4���@,o M���@3�,�c�P@:���F�@A�� �@Fկ��[�@MU�(r�@R'��s@Vc��d�H@[C5�K@`h�w�z@c���GW�@g��e�@j�F8}@oRj�'b�@r�6��$@t� 6 ��@w�$�6�@z��ĥ@}��>��@��01^x@��0�i�@��a�Ǯ�@���~W@�?�`�a@��1�.�R@�X&]D��@�����^G@�y f$@��	*�`@�+�3�@��F��al@��hG�Y@�~�Q1Q@�m��i�%@�q�½';@�E�,K�@�\���b�@�~�V���@��9m��}@��᭟z@�$��@�r)�ʀ@�ʔ �:U@�.<����@��C��I�@���x@���6�@��p��@��˳��@��z@P�_@��C��}�@�w�~�@�^	m���@�K�j�        ?�]���?�]��2Nw?�)��D�(?�6�z5-Y@Ҽ�7�~@��)봆@�m�t�)@ π�pOl@'�R9ȷ@06i���Q@5�Q�Na@<DZs��@A�G��@Fq�\R��@K����x@P�*/<MQ@TP"���@X-�2]��@\�
��r?@`��nyj@cK�zN7@f22`e��@i^'�KC@l�3#��@pG9����@rL<��B@tx���@vΚ�4@yNfB.��@{�l�	�@~Ю�Ĵe@���k�@���,�@�4Z�BX�@������@��;.��i@���{�@��Mp�@��E|�;@�*��V�@�X��C@��q9�h�@�ڪ�.P@�.o5���@����n��@���܀L�@�t�����@���hU@��Mc7�@�,e0Ч@��+��ϸ@��Zu���@��Ɨ��@��7	݋�@���zҧ@�z7�Ir�@�w,��@�z�B��@��M��@������@����\@���`$@���xs�        @�>�!@A/��#2'@Z ��>��@kL�|��@w|vP b@���Eai@���4@�IhI�wJ@�pt��@�Bzz[��@�`tgN�@��b�,��@����[a�@�t�S�%@��k< �@�L���*@����p��@����"J@���'W)�@���x�W�@�T��*@�����F5@ğ�sk@ƌ翌@ȐXw!�@ʬ�s��?@��	���@�/�{��e@��S�0O�@�@	E�@�W����@԰ل>��@�����^@׈�ߏ�z@��Zt`�@ړ7�:w�@�+U_@@��U.q��@��@g�w@���No@�.��J]@�l'���p@�[�w���@�Qi�L�@�L�2r�	@�MU��d�@�S���Ъ@�_W��$�@�pm��Dc@��v�j@�^���@��<s5*@����l�@��5��@�"�6��@����@�Y�<�,.@���1"@�":d��@�AA,�&�@��y���@�����"@�@�y�C�        ?�`�"�v�?Ĥ]m�?���M?�l:IV>W@ �%��ܨ@
��vϼ^@�3d&B@l\���@!�L#7�@'�����@,�v�KHG@1�#��*�@5Z�˂{@9W� �@=���k�[@A8$!d��@C�=ir��@F���_K3@Iyt���@L�^
n�@O�?{�@Q�Kw�,�@S���@U�E��&@W���T��@Y߭ɶ�V@\,��mU�@^��Ez�@`�3��*@a�={={@c@�іt�@d�f����@f.����@g�u8!�L@iX��^@k�B�@l�s�V�@n���^2q@p.Rv�@q ���Y@r4*�+@s�l��@t"��w3@u1��0@vHQn5N�@wfd�GC@x���Q@y��&>B�@z���!��@|,}oJ@}q,Q�"�@~�9$�h@�	� m�s@���k@�j]�pO�@� �*��%@���蟕@��u��@�[��y@�!�CbS@���sf@@����`��@����rb�        ?�4��+?�J��M;?߳D[�*?�U>
@����Q@�aGY@Q��Y�@"/=��d�@*s0�@2E7-��@8c�$��@@����a@D��Kv�@JJ��b@Pg�Ğ�	@T0��?@X��t�X@]x#�%e@a�;�g@d�����@h�Px�@k��;��5@pu��l@r]�G��@t۟���h@w��Z�d0@zxͳ�n@}��q*@�y����@�DC�ӌ@�-G6��@�5�?���@�]�(}��@����?�@��S��@�����b�@�'��c�@��f�~�X@�V��U@����WG@�<`Ԍ
@���=�@��o�
��@��%_�ӝ@�}E���!@�?��@�IZ�@�]�Bͮ_@�|Tm�a@��4E��5@��z��ƣ@�?m��@�^�u}��@����
�@�B�P�@�w��r��@��׆��@�hŗ�ݚ@�x�'�1@�BscdY8@��Q�(�@����C7@��Ģ$�        ?����]��?ʤ�t� 
?�5j[hQ?��#�
��@�n��	V@��O;?�@ۊ����@'L��I@0ViG.�@6-���&$@=RD��X�@B�c���6@H�Nv4�@N� "�Y@Rw�X�~�@Vm@@\��@Z�5KH�:@_��*��@b�� ��@e��q�@ihS{ }�@m4�0|�@p��N�@r��H��@ub^���e@x���:@z�&_]@}�Ϻqh�@���iG(�@�WӸj�M@�4K�K�@�/$��"�@�I5�)B@��I��,Y@��(?�<@�Z��<t@�����L�@�]z�e�@�� 3�+_@�T�aId�@��*'��@��@��@�S�_m��@�$n�P@�	M�dM@�E�^��@�E��P/@�ӹ�9@�6X�O4@�]D>4�y@��r/)�@���S���@�T�@�i7�]�@��y��.�@�3#���@��5���@�*��Y\L@�[�6�(@�'��Aǟ@��d�}Z�@�КY%i^@��X\�         @����@9`�{�T@T��7l��@g��%�j@t�r���@���P�U@�CL�\c>@��۠��@�%��e��@�X�8�;�@�����N�@���}I@���s@����Oa�@��mz{�@��ф��g@��8߷�p@��q�}W"@�V]�(�@� v��#�@����@����@�2[�e^�@ɀ��*/@���?)@�y��s��@Г�8���@��� �K@�rK�
�H@��7�C@֕)���a@�@���:@�� �@��/�䱷@ݮ����@ߠ� .@�Ҕ���@�ݼ`�x`@��è8z%@���1%@�4T��Go@�b�pu�@�[���@��׃	.@@�$rG)�P@�wF�tU@��l��n/@�8����2@�x\�@�Z�ُ�@�Q��13@�{�t�K@��M���@���'_@�v���<@�_Ј�(`@�>�5��@�!��U�@���@��ĕ,<@��l$ &&@����ܙ@��~6��        ?����pT_?��V���?�
@}J]D?��53M��@�¯�6O@���WP@os<�
�@/W"���@#�Z�	/@(�F�dd�@.��u�U@2�.(�o@5}Dp`>F@9([�w,H@= ێ�G@@�L�@B����`@Eg+�R��@G� A�\@J�����@M�N<}�@P@�yCZ�@Q�+fw��@Sn��Y�@UI۝s�@V�ֲ���@X��pip@Z� �X�@\�����@^������@`ek��4�@a��d2@b�~�]A@cܪ倐�@e��6�}@ffo���@g�&�rN@i�S�Zm@j�̽�J�@la60@m�*�5�@o��Q@p[Tr�@q-O����@r\�m�\@r���'�@s�B���)@t���D�]@u��/�y@vz���@wk�\͟v@x`�Я�
@yZ6��@zWϭ���@{Y���&@|_'�K��@}h���H�@~u����@�tR��@�MV~e��@��/ɳo+@�f��m�@��'H��H        ?�s���'�?��4�3�*?���}�?�nMp�Z�@ ���#��@��˫(@i��̑@"�O�E�H@+�N�"hr@3����@;	V��Y@B	�%�VJ@G�r�#^@Nax4�@R�cn�@@W:6D��@\E�Q�hH@`�,�pO@d6A؏�@g̥���@k�~@dʒ@p΍a��@ry�Yz@u��T��@w���K@z�2vv� @~C<��9@��}�@�Ì���N@����t�@���5�sP@�9O�@@�w �vٺ@���c�@�G��y�@��#��@�z�Q0&@���O�@�'��T@@�����?@����Q�@�GiO���@�!�_�@�k� a@��K"Qlv@��eZË�@���O�&@��u0٭e@��1j�$@�Eu$�:@�M����@���F��@�ݧ��l@�4�C�@���|ń�@��[(��@�pb)�@�v��W<@�8�I��@��ƛ��W@��kX��@�����l@�p
2        ?���ǅ?��y[�R�?�K��^~�?�v^5~|<@ͅ�k�@9�ּK�@� G)��@!�&��@)=�,���@1F��u@7����@>E_XZ�@Cx'}�n2@H�����@N�3��@R�<sS�@V�֊@[�u��H@`j����;@c]@(�8@f�(�G��@jM�,t}@nR@;�x4@q\�b��@s���A��@v\���|@y+���J@|06T+�@k��:z@�o�[�@�E�4��@�91���@�I��Lg@�xP�pa@��Bj$��@�1,:��O@�^L�>.�@��L�i@�	tD`@��ѱ���@���P�@���D���@�\�0z�@����{@��r��@���7ۨz@�`�F>��@�e>���@�sz����@���L�i�@���N`��@����@�0�#��@�P� 9h�@��)N�@���RF�D@�RlXA9s@���%KPz@�4DBڽ�@�Z��r^�@�!��^z@���@��O%ܵ=        @%�[Z��@H�f	씹@bˡٝ@r}%���@[����@����'�i@������b@�[�i�H@��#��G�@����H�@���]ń@��q	י<@�z~{M@�q6t�h@�b�Xe@���)+f
@���e�@@���2�@��9 zc�@���X�@�꩙
Q�@�%8@�u�h�`�@��40!��@�U4��w@��]��@�B􏣬 @Ӟr
}�@�dx��@�usI�@�����M5@�x�K8@�~�t�@ܭP`���@�[�Ox-@��
��@��Nd�l@��k�Z�2@�м�_{�@���ê� @�ˬ�
�@���H�$@��Ufw�#@���'��@�k�m@�*VM5@�L��,�}@�s�鈓0@��]�j@�͢�}�@� ���@� ��X@�8��#@���H&	@�w�]�@��;�@���:@�c_R?�u@�
����@���k�)@�^+��/@�
���hr@��
�Wn2        ?����V@5?�q�tE?�2z��;@~M��~@g��[��@�c�(v@#M��Wc�@*8ŀ7�@1@�k��@5�׿օ@:�VR�ĥ@@;ّ,ח@C^�Y�1@F̅����@J��؆i+@N��e�D@Qy�����@S��z��0@VW۟aO@Y	�Fj@[����\@^������@aJosY@b� hlX�@d��v6-~@fx��� @hp��XV�@j��t�@l���B�@n����@p���}@q�jq��@s��p��@t[=(�8@u�bE�T@w&	�!@x�z�5i^@y�"K7v@{}Ҫ|)@}�LBB�@~��A̟�@�%�6S�*@���\ ɏ@�ۆړ`a@�����0@���˲Έ@���d,�	@���$�7�@��p��@�}0�F�@��oZ%�@��sC��@��B��*@��%s�b�@���/�@���*��9@����xP5@��޾�@����_��@�<s�แ@��ia�ƞ@�r��{�@�m^�\>        ?���TO��?�$G�:h�?�c~T�k�@o0���@+n�4k@�+�d��@'�\���@1�Pi7i�@8ʰc��@@����>@Fz�'��@M*�>��@R�Y�J��@W(�cO��@\{@�E�@aF�yΝ�@d�(��@h�b$Ma`@l���d@pĩ��@@s\f�*@v1���i�@yF3z�qh@|��ʏ�@�B�7Y@�؅ܚ�@��a�E@�P���@��&�Ǩ@�)��c\�@���VV�@�M|C`o@��� �@�T�]�h@��W7�\@����C�-@�w|GnE�@�W��7�G@�L�Vv�@�W�KXr@�<~Gԧ>@�X� p@�~��e@��o7��@��v�%@�7��ꀮ@������@��HFFG@�Y�v7�,@��Rݫ�@�V�{|R@�����M�@�B�4�!@�^�Lk�@��l�@�ӻC��@��O&:j�@��(�x�@��F��4d@�������@��=nf0@����~@���~!�X        ?��k��?�J$��qd?��i7rš@��Ρ=@C�2*^*@~9s1b@%���@/��7W�@6[0�O"@>g�&B�@D'M&~�@J#�#]�@P�����@TӦV$�@Y�KW�Y�@_H�9K�@bѲ�@fg-�8@ji7{W@d@n��Ն�@qㆦ�&�@t����~�@w����@z���}N'@~3n5��@��Ym���@���0  �@�"�!@�o�9�@���d�@�~_�~@�Bw����@���!�@��$U���@�E�5t�@���G�N@�����	@��H���@��P!@�@�Ý�O|@��,0=�@�w4�u�@�I%�L-@������Y@��E��X@�����@�d�Y:�@��c0���@�f#/�r@�쾬�@��MB7a@� �}QV@�gGE��R@�D��s�%@�(��]�[@�D�{N�@�v�e@��>Ց@������@��x�U@�
�}�b2@��̷�@�4�Eo��        @ ߑuy�@N5�X�cz@gi��V�T@y	�>R{c@��Р���@�����@���=��@�����(&@����_@��Pi��@�a��l@�����@��jEV��@��]�0G@���V^�@�z�CL�@�=�-��-@�3�k@�[�V��@ϸ�����@ѥ#��;@ӈ=ҽ��@Ն7i)�@מz�qOT@�ї�	�@�On�ۂ@އ�pЃ�@��%�2�@���~�z�@�/���@��ň]@�p,2��@�c�g��@�$��E@�í�%R@�p)�F@�*Oƙ��@��/bdL�@���̞�b@�՜m��@��0��4�@�͡n {M@���E���@���!~�y@����&�@�fJ'�@�0�S���@�XmB-�@���(W��@�����/P@�����@�8��d1A ?�)#=]A ���0A�� ��tA=�S�ȤA��j*օA���p`�AVc?��Añ�QAʛ|��mA���&�AJ-�_�        ?�z�LV,Q?�����?Ա�)6��?�a�v�e�?�ڑ����?�<d��@������@6�0E��@�L�P�#@UR���@ k�\���@$���Q�@(�����@,�¸t�@0�Ap4�@3n�Qn@6Wf��F�@9|�P0��@<��~E�@@A���@B3��"�l@DG|��e@F}
9t(�@H��`�h@KO���v�@M�
K��@PV��l�@QȴDf��@SL;�h@T�n��6�@V�\�l+@XA*]@Z����@[�P�
8�@]���b��@_ף?ض�@`�JkMK@b�(��e@c#����@dH�Ɨ��@eww=S�@f�:*fY�@g�?h��@i:t�]L;@j��; ^�@k���4@mOH>��@n�dl�@p/���@p�OE�E@q��}��}@rgm��@s4ڔ�T�@t���?�@t�c�~��@u������@v�G��H�@w|�Me�@xe��2ZB@ySzm�@zFMq@{=e��Fy@|9��%9        ?t�Q�0q?�N�	�n�?Õ ��n
?�)�V�?�C�M9?��ϖ|�'@;�]�@��k��@�e"Q�@"Ǚ���q@*b��^@1�T�W@7�ܡ�s�@?*@���@C����Je@IM! @N�2���e@R�����@V�%G6�@[VF%1N�@`/_,��?@b��8��@f!�\sB@i�Գ�@meD`�2@p�=�X��@sD���@u���٥@x3��ȓX@{�Ko�@~1�iiu@��md�@���"7�@�r��N�@�xڰU�E@��Fy�p+@��N��@�O��Z
@���Ӵ�@�D����@��|�F�9@�(����X@��(�4@�Vs#$�@�	�D�$ @��Iv�g�@��P�E�@��	[~U@�L�7���@�W��V��@�l�=�s@�����@��i� v@��U#��@�'�Zu@�p�u{~U@��,ΐ�@�"Vxq��@��0Ffb@���b⿣@�}�ݽ�@��Ϊ�@�M�O        ?�7r��b?����}?��@���?���@,?����@	��{��@F�zk�@|�~�v�@%�����K@.�w���@4�2�^n�@;K��08@A���E@FGW���@K���_]@P��*�	�@T�d��@X���ؾ@](j����@a6�X��@c��s.@g	>T�1Q@js�8��@n1w�u.�@q"�O��@sY�Ž�@u�l-y�&@xUh2].�@{D�DR{@~�"�
�@��wXf�@�W���q�@�'�@�$��@�yt�z@�Gi	��@��ǝ��@��gٕq�@����"�@���ۭ�@�}�H��@����X.@���Mi�@�5ø��@�Ϡi�_�@��c���)@�j�7w�~@�V����@��p!���@����q@��C��"@��E�.4-@�4%@�L.�46�@��U� �@���]���@�1�����@��!�?D@�NÅ�n@�T0*z@�(��h@�̯~+�@��M�B��        @jzLJ[D@-����B�@F��.�wG@X8��U��@e6�[��@p���@w�VH�/�@�*

���@�&	�|�@��~���@��?�9N@�/����@�"J�K��@�x"@&�^@�����@�,v�v	b@��|ֆ2E@��N�ܕZ@�*��S@�����@@���K��@���w�N@��x�,x@�Ҁ�f@���po�@��D�	@��5Ok�@�ẁ���@�G|�t��@ýRSS@�CN���@�فP�Ӥ@���Np@�6�x�v@���(���@����JN@ϼx�w�@���5�@��� x@��2l�(@��d�#F @��*�Ҿ@�>�a'�@�k4�u�@؟^&S�@��\S���@�!J�\@�j��w��@ݽ׵
��@��`w�@�=�Xn�@������@��;�Σ@�h��e�@�)�ǢƦ@��_ɀ�}@��HH+@��"g#�@�Tv͔J�@�)%�GM�@��]�@�޺���@鿸��f�        ?��R{��?�:�d���?�[+��G?�BU^,?�/�"t@�@vc�3@��ޓ�@+�l+@���z�@$�n�<�@(ۇ6��@.$8��=@1���2�@5"9A���@8�t$��@<=`�׽�@@g�9�@B1C���@Dl>	^U3@F�{��@IF[��ڈ@K�iUǥ&@N�:�cZ@PǮ0%��@RL���@S����#\@U��X�H]@WJ� �q�@Y��� �@Z���E@\��G�B@^�L��q@`���Q�\@a��5]O@b��1h�@c���w|@e/!a��
@fp�Nn:�@g�����,@i ֩��@jta�S�@k�|ȥ�@mW�
X�@n���}�@p3���/i@q 1y�@q�B���@r�T�/�@s�W�wݫ@tl^�7@uVv	i��@vF�5���@w=�DV�@x9���$@y<m1Tc�@zE�����@{U߬�@|j�b�:6@}��"��:@~�����@�S�0(@��W��$@�v����        ?��B���?ђ�yؓ?�a�4.�@~�p�z�@Lb @Ѱ�~�h@$d���Q�@-c~���@4]LyN��@;b�͡��@A��8ޣv@G����@M+/p��f@R"(��@V=Ğ��@Z𼐤I�@`#�dV�@c%�$�\ @f�(��@j=�e�?�@n\�|�{^@qq&�Py�@s�{���@v�ހ�%
@y�K"r@|���F�@�8P#�5@�ʃ�~�x@���C�i�@����1�@���q@�8Z��0�@��WI�F�@�6�)���@��W!�@�aV��@���e���@�q6�ζn@�߿`ky@��,(�f@��o�8]l@�z�6��@�o��wՁ@�<���@�L&U<v@�e�{o+j@��W�#�@��UڂA3@����QJ�@�7F�䕱@��D{ʌ[@���շ|$@�D^Y(��@���v�8�@�-]~[#O@����.a@����l@�m����@�?��Ť@�����@��]ͪϱ@��oq�)�@�������        ?~�1�v!?���js?ˑ���%�?�6����?��5/f�4@�A�SZ@�_I�*@��󬍿@#<�yq�@,b�xZ%@42���@;��}�U@B��I|�@H�\�m��@O����g�@T:�2e�@X�1TZ�@^�<ɓ��@b��Y�Ͻ@fX�ϝ@j� [?K�@oNGw�T,@rLᜄ�@u;d�	�@xy/r��@|	�մ��@��ޤ��@�?�Ɵ�@�i��J�@��-�t@����g��@���Օ�@�� "}C�@���~3N@�XKm�J�@�F?4)@�T�͗<@��Wny �@�ح(Z��@�O��ߙ�@�v.����@��l���@�L<�Tu@�� ["C�@�r��u�@�%��4@��Y}�@��	^ӟ@��_p�j@�ʃ��G3@��o��`0@�l��T@�<mF�4�@�q���@��LFY�Q@���4W�@�\��7E@���e��@�:qp)b@��tlJ�@�N0Svoh@��ۑ[��@�����ru        @
�Nc�@:��~�5@U}6ΣG�@g��M�LU@t�q��P@���� ��@�蒾\j�@�[�!��@�v��R�@�Fy�+��@�明�;M@��M$���@��!o�O@�ݦZ���@��(ϣ~W@�V���@��WԸ�@��d
�4^@��d(v@�`ף"0�@�m�z�G0@�C��@�0�'S"G@�7~���@�V�{px@ˏoů��@��ND\�@�&l���n@�i2f�F_@ҹ�p�@�A��Z@Հ���a@���T�W@�~X�O@�@����Y@۲��@�bwHƆ@�� �an@�u����2@�c���m@�Xދ��@�T���}E@�X�1d��@�dľ�V@�x��d��@��;g� @�;�,�9@���JV5@�J��Y@�YL8k�<@�� ���@����)Kp@�$Roq�l@��8��`@�s�@�D���$P@�
��*�@���z2o@���ބ@�X��"e/@�(L�̚	@��:/���@��cUi�D        ?�nnܖq?Ώ/~D(G?�(Mtm?����E"�@yĹ_Kt@�
��:�@�y�(@ M���V@%KUMoT�@*���e@0�	�@4%�`�*@7�a�b�@<,���q`@@Zv'�D�@B�i/�|@Ei{�=��@H4�^ր�@K-��q�@NT���@P�:����@R��S���@Tnm�p@V^
�o��@Xe�2�Jx@Z��˛z�@\��PQ!�@_
D&��@`��	��@a�-�!�\@cD�7.i@d�2�my�@f �2�*�@gq�M���@h�0���@jy.6�H@l�C<s@m��3�@obt{�m@p�<B�@qs_�O�z@r]��,Ѝ@sM���@tC�p�=@u?H����@v@�,�-F@wGw�7@xS�L���@ye��$�F@z|�a��?@{�� ��@|��ܹ�`@}�/���$@r{@� ��@���S��@�[��@��1D\�c@����Ӏ@�Io�t�@��h1q�c@���E��F@�P����f        ?��F��V?���Dv�?֛�r.�	?魒�
�?�K�z`_@�g����@B�L=�n@\\9�Ƅ@!�O��F@(n�bQ>�@0�(�AT�@5��Mh@s@<}h���@B)�?G�@Fȩ���@L-�v��X@Q3ǚ�g�@T��M���@X�J��
@]Tgoҋ@a2����@dn8�h@g��w�@j�y^$�@n;EHF�@q#d5��@sSN��n�@u�o陌@x8�!]��@z��JEp5@}����Y@�u��A@��A�@���frXv@��|i�@���.���@��32횘@��>�K-e@��#W��@�0x��Sa@�lY�#��@����@� f�<R@�xg5�!U@��I�@/@�w�b$Mk@���b4�@��zľ�@�q7.m�@�;~ϣb@���[@��{��83@��p�7��@���Jcfb@��pn�	@����T3�@���{(��@�t�
E@�KD^!\2@��� �$@��H�_2@�7[���@������        ?�>�X8�?�oK?�g�?�L�CS�]?����%�@	*ԧ6F@w��;>@��\��@&F��'d@.���|�L@4��6���@;,�# .@Aq���>@E�`_��@KOV�$��@P�`���@T9N�U��@X1�b�i�@\���f@`�}���@c��}��@f�Rz�u@i���Y��@m�<�*��@pӯ�!��@r�Nֹ$k@uVD�n54@w�aoUG�@z�r�rI�@}�=�t؁@�O��7�@��ji�
�@������J@��"T��@���V#h+@��\m��@� ��n�@�]x�T[@�m�0�@���K$@��Jr�V@��m��yw@�K�'��@���4�o@�Ae�m��@��A��Z@��m��n�@��>��@�DV@�D�����@�N��3H@�cBE�c@���I�ۗ@��n℗x@�ݏ���F@�<Sٿ�@�c����	@���ǳ�h@� ���@�~[�G�@��
+K�@�9��o�@��{"�@��I�MQn        @��H��6@D7K�Z@^a�����@p�+�&@{��GJw-@�w,�-e4@����@����$r@���J_h�@���t2�@�ٚ,w@�%ͣ�@�ؚ"��@�y��6�@�9m��@�-q�c�L@�UfT���@���a�'�@��O�Њj@t,��@Ă�º�9@ƛ�>X7_@���3�h@�!�[>�@͎�j�B7@����@�^�n'��@ҿ�����@�/��e�@խ�Tu@�:�: L@��׺9�@ځ��{˟@�<�t�7@��A���@��Ġ�T@�㯎Qh�@��Ǩ�R@�����D@��]�`|�@��V��2@�9���@�A <��@�k� x�@�1�\�@��$bF�=@��4�]%@�c\�h @�l/߲(@����c@��&@�jd�QJ@�!�6�T@���)X	4@�~4�@�^ ��=@�#д��&@������@���M8�@��ZP;@�]�^K��@�4��o^h@����,        ?�%�n��Q?�stF$]?ߥ�hX�?���[�?��րo��@k�M$�@�2���;@ZwZ>{@O�{�
@#D8��E@'�㠄�@-#�Y��@1ahJ:@4�|���e@7�l�i�@;���%�F@?�� xf@A�x���@D8�U95�@F��d�|�@IO׵3cW@L�ru�@O"�Z-v@Q"�5��@R������@T��뀺5@Vw��B*@Xs6��ٴ@Z��1���@\��e`��@_���@`�Ą�Υ@b Ximz@cS�����@d�H�\�l@f(xԚ�@g�p��5�@i:��y�-@j�����h@l��f}k,@nP�����@pX�Q@q=�iހ@r��;�@s��%@t9�`�@u+�{@vL��YcZ@ww5���@x��2H�@y�"O�@{1�zÇ@|�ܖ/�B@}�-��R@F����K@�[�F�VO@��`)��@����j@���vE�3@�sY�z��@�Fe���@����u@������        ?�{��	?������?�&�uѝ?�KIԢm?���)�@Y3kլ2@U��p&&@X���@&U�?�8}@/�>��@6��Qu@=����H @C}���F`@I�۷[K@O��-)@S��
��@X0V���@]IYjZY;@a�
�E��@d��Ί�@h_p���@l^3>w9@pb#z��g@r��M�@uk?�@xD���@{YF�N#�@~�_~d̎@���Ш�@��nn��@�
끡F�@�2��K
v@�{�م��@����@�rDk��z@��J�j�@����o��@�r:�fao@��<ЯMp@����r�@�G����_@����4�@��Te�s@���`���@��<Ҍ@��Ώ���@��*��@��2��R�@���r�@�E�<xn�@�vo��V@��<a2�@����i�@�>��Z@�����?�@��]�6\@�X�ɗ)9@��}�kQ6@����JQ�@�a�W��@�'%��}@��(<>�^@����Q+d        ?s�t��-�?�����?�^uZČ�?�����ID?�@AÚ9?�j�3�1�@
�S?�(H@���
�@ �WV_}!@(��pW�@1�S报�@83�kQ��@@7�1�I@D����@J�a��z�@P���Ne�@T����_W@X�Ѝ ]@]����@a�cٻ�M@d��B�@hU�k
��@l W�J�@p#�J8A�@rg��u��@t�����@w���m�@zg�[X@b@}���s@�h.��X�@�-����N@�쓖4G@��g֮�@�6ܸFz@�y!���@���W!~@�`D6�@�'�	�@�gf��SG@��,�ħ(@�d�VrО@������@��Ͷ���@�i�2v4@�;��*�@�!aqJ��@�9v6�@����}@�$!�g��@�>�9'@�cRh��@��!���@����s@�@��$�@�[���O�@������@���<�u@����Ԏ@���z�@�:����:@���'���@��Ki j@���F�        @	?��I��@5�B�X�|@Q'A����@b���E�@p���1q�@y��t���@��@h)ay@��_&�
@�p����@��{vi�@�'�U8Vk@����y�@��ᆞ�@��Ĝ�s�@�����˕@��^	X�@�q�r߫@����Б@��JI�gi@�Ё$o��@�(oO�@��-,">@,��)�@������@Ƒ���r@���S��@��ژT@͑���1�@��2��@�v��0��@�����{@�pn3OT(@�
(s5�@׷����@�x��1�@�NɯB_@�7��rc�@�5��A��@�iԇ@Ḥ�hi�@��ȘS��@��9@�7�)��@�y���@���yK\@�#ҡ)�@�N�8�@��Ȝ���@�s���:@��Y#Q$,@�J�-��@�Y튺@���y+�@��e�@���@��yH5@�@�����x�@��Hk�~4@��t��07@��
>.�y@���S�ӽ@��HF#N@��s$��D        ?���eMD7?�b��Q?ݧ����?����a�?�_�YM�@A� �͠@�/ve�@���@�ݣ�g�@"o���jF@&��*I�@+ߤ��@0����J�@3��t���@7
�pX@:��=�A@>�q��D,@Ad�Ũ�z@C�Y׍�@F�n�:�@H�Y>��@K{�%|�@No��{@Pȼ�y �@Rq�)?@�@T3����@V;�;�@X �bD��@Zw1��
@\4A�u(+@^u5$�@`h`Di��@a�ԟyu�@b�w��K@dE���@e��G�B@g#K���@h�Q�A�@j?G���@k�tR���@m��L�x2@ob��l@p����T@q����5~@r����~@s����A�@t��(dEh@u�*��i�@v�W��{@w�q�FP@yv%�1@zJf�/*@{�Kv5
�@|�5�ǖ@~?^ѯ�@fy�2͐@�`��Mx@����@����tG@���F��@�A}��Z@�4S���@��6'5��        ?�����?�C��Tץ?��Z_fM`?�%"�@InJ�u�@�sr��@�����@"��%�@*��7�@2��)/��@8����%@@ef��q@E �I��h@J��s-y@P�`GHe@T|���L@X��� �@]Յ#�Ő@a�+��j/@d�ʳH�X@hP��Yݝ@l%W�yOm@p-�5��@ry7�]�O@t�5{��@w��]^�(@z�z����@}���@"�@���ߧ� @�d�+d$
@�U���c�@�h3�t#@����U3@��/�G3@�q�-��v@�	]�p '@�l��Ů1@���iV�@�l�	��@�	�E��@����5�@�}�5�S{@�U��X_�@�@����@�?ȩ�P�@��B���@����瑜@�ٵĐv�@� ���E@�1�B��@�m<�>�@��7�#�Z@�����k@�[�J�@���V~[�@�-`��ϓ@��dz�@�Z4L�@��u��@��aQ���@�{��R�@�T@q]�@�2_�4�<        ?���\��?�!C;B�?�}�}��?�ź�h�?��yr�(@w���m@N�x�2J@+9ς�@$��tkT�@-V���ad@4#xh�`@:�Y%�;@A���b@Fq���S|@L-)�=@Qg�O[@U1u�E�@Y|=Z�M@^N	h��@a���M)�@d���$Y@h.�H�@k�3��G@o��i��S@q�+Hх�@tI�y2�D@v�+/D�1@y��� ��@|q��F�@�gR]h�@�x��U�^@�D��Vd@�/��O�@�8���մ@�b�XW��@��khT�@���@7[@�T?��R@���^( @�D�8l@��w9A�@�!���A�@��>�E@�u#��(�@�:�YuJ@��4���@��`MT�@�}�s�d&@�����S@���s��@��uJ�@��$�(�@��Nyuq@�?~�K�@�����=@��%��5�@�$T����@��uT�'b@���J�@�b�x��@�p:ݍ��@�4�]�&@���1D;        @{a�?��@4t�o�l,@P�at�d�@bB�'�:�@pV�+>�@y���M@��o���@��i�@��&AB��@�Q�}��@�s��SM@�� S�/@�D�)[��@�����܇@��V�-T�@��r�y@�� ��kD@�\���@��U��#}@��g C�%@���E7�B@��~V�@��/z��<@Â�	�3�@�u0��w�@Ǆ�{�<�@ɱ�~���@���b[<@�eN�`\@�v/C� @������@�+z0I}a@ԝ���;@�!Cb�l@׵c��2@�[>U�*@���/p@��n��@޹�%���@�T�}���@�U�8��@�`og�f@�t�4�l�@�"��]9@�<���@��9cb�A@�"����@�e�Z�;�@걑__�@��q��@�e��f�@��Z��k�@�;k�*�@��pa�.�@�U%fp�@�d�=��@@�0Jz8ٯ@� h�c@��R�	@����X@����1@@�qgS�@�Yw��lS        ?��ҫW�?ǬĊq��?�Փ{�t�?����k@ Z�FĿ�@	W � �@-��me4@�!K��8@ #��U@$t�cє@)N�	��@.��s�J�@2W�@,�@5�J
�!�@90��VHi@=��J?�@@���Y�@B�3}�@EC9�]Ţ@GѶ�vO�@J��ɂ�Y@Mi�1��@P:Nj�l@Q�Y�*�@S�gB�q@UKygM�@W'���b*@Y�I���@["�+��@]B��iq/@_zCt�R�@`�f}	�@bG�Vj�@cW��hm@d��N���@e�!-P�@g`趵�@h�W�_ J@jP�T�@kۚ��<�@ms�qr�j@o��|N�@peH�s'@qD���s@r+:�t�?@s={G�@t���@u}F��@v�3]AT@w��~@xro��@y5�~��@zS���n�@{x�@.�@|����@}؟��@�ZZ!@�*�!LZ�@���U͝(@�x���@�$�V��@��L,40@��zz��x        ?�:h��-!?��z��;?���,&�?�.��:�8?�3�h�4]@t�a�.�@��Vy!@� 5&@#�!Z��@,I�@3M걠�@9��w�&@@�oM���@E��m ��@Ka
����@Q?��@T�C�@Y8
��m�@^/�j�z{@a��.�@e ��t}G@huyM�yQ@lDX�w3@p8,�@r~u#�L@t��^Nm~@w��6 /a@z��yI9�@}�%�9:z@�u��� @�9��@����@�z��p�@�5&]Q|@�p���@��-�\��@�E�Ԣ�@��2M�Ql@�M�מݹ@��U���h@�;���7@�˰���@�m�[@�����@��Ut��@�������@�����5�@����0Z@��X>���@��2TǄ@��o��\@�!?=��@�MIR�3�@�����@����R�@�
���Zg@�\̄O�@��H�_ @�-����@��{��hY@���W��5@�B3� �@��a��        ?�L����?�h_��&�?ߢ�R�=W?��~Y��P@F�¶ʧ@v���@�Y�g�@"�	v�@*���f?@2��a7�@9A�9��@@���MU8@E��e �@KUV�L@Q�� @U
���3@Y���;��@^�V0�E�@bT��d�@e��<Ҙ!@iG�9���@mT�ËX#@p�y�r@sTO�9y@u�u�_@x�u�
@{�����:@K��v�@�o=�@�W-uR��@�^��<�@��-@���d��@�6��X��@��ٜGϨ@���C�S@��@��ǡi�_@�!F¸H@��� $�@�k��nM@�,�< �@��i;6�@���D�/@��d>�@��6@�������@�Ǔ�R@�7,�N=�@�`�]��@���b�7)@�Ϥa���@�̤K�i@�c�Gu�@��m�QR@��j��@��[Į=@����H1x@��W�m�@�{�����@�B�>9��@��1�^@��'���        @	@:v�@6�Q��c@Q"P���@bi����@p<U$���@ye�l&4@�\=�8�@�V@���@��!�C�n@�
x��'W@�.=ye�@��l���/@�0�3�@��	����@��Ny�� @��X��i@�¸�ۙ�@�B�^X�@����@�ׄ�3?i@��X�h�@����Z@��˻2W�@úO�|;,@ų�C�`@�ȏYe/@��M���@�K��16@κ�����@Ф ��1\@��V���C@�`xQW�@�֏��@�\�����@��,��+�@ٙ��s֏@�Q ��Q@���Ӄ@��[��ŗ@�mV�`�@�j���}�@�pI�� _@�~˗׭�@�+6��!@嶊����@���T�@��[fa�@�N�E?�@��S��B@��SnH@�:5�/�@�u��@�ḿ@����e0@�{�����@�>ٹ>��@���d�b@��/��ˉ@��TR7<�@�z2.@�T�?��@�4l���@��@5|        ?��m�+t?�%��H�O?��E��1�?�P�kqZ@ *}�Q@	�r�~@��h /P@�bp�S:@ ��mq�<@%�����@+��	�@0��m��@3�)�n��@7� 	��k@;�k��?@?�S���@BH���@D�f�c�@G�z��,@J`�v�u�@Mp*��^�@PWk�4e@Ra)h6�@S�����L@U�M6��@W�Zz;�@Y�EDh0#@\C�.�'@^K�ch�L@`Umn~Ө@a���3 �@b���Wą@d1j5��@e��d �	@g�x2%@h�"���@ja,�u�@k�x��V6@mR��B@o	A��=@pgX����@qQ�@rC��� �@s=���@t?�St��@uI�]��@v[۲P�@wvFW^	@x��u�@y�X�ρ�@z�<��@|4�(�T@}z1���#@~�g�*�_@��U���@���ORx@�tZ]�}@�-h���@����@����D@�sKF�ʱ@�=�f=�F@��%�ӝ        ?�BB�?ĶK���?�Ϡ�y2�?�O33��&@�
�\�@c��S�@�
k/a@%�V���9@/�a���@5�p�=@=|~��@C�]m��@H�e���@N�ս@S?�cZK�@W�W��S�@\���*�@aE�P�@d8�O�@g��68F�@k�����@o�1�kD�@rO�	��@t��H�&@w��J�	Z@z�x����@}����5a@��GJ���@���8�	@���'���@���f�c�@�Ր��	@�.%�@C�@���^�(M@� %��P@�}2	���@����[�@�h�E�6�@�����m@��}�t_�@�H7���r@�
#�g��@��~��@�����@�\��a6�@�a�Ny��@�o���@���'�wd@��KQ���@����v}P@�
؆ڢ�@�K,�X��@��*�� "@��ԁ|�@�MAN7�@�����p@�1�uT�@�Zŷ��@�"�\���@���UY��@��a�|��@��-^�y�@��yAE*�        ?�k�^qi�?ȑl*M��?�8�GB�o?�r��-�@c�K�@�W-S{@���%�@%�#�@/z���@59$V�U�@<1�=��>@BG��?3@G8�����@L��� ��@Qʼ�p�e@U�v���H@Yʐv�/�@^��I���@a�U"��@d�Q>���@g���M�@ky�����@oC�;~�@q��M��@s�.Z��@vKCG��q@x�A��@{��vPs4@~�J��{'@��Q��s]@����0�8@�E
x��@�$x|O�\@����J@�6���.@�k^�D@���t�;@������x@�����M@�5�� @��"���@�Nr��@���6+��@�2�,�0o@�ۊ��@��+��&�@�_�B�>�@�r�Y�@���w�b@��;�K@��r��7@�0��*@�K�*�x@�q2a�@��F�@[�@��5�D�R@��ʊ�@�id�)@��>�o��@�!��h@��xu:q�@���M�W�@�BRi9r�        @'�A�1�@>�9?���@X�*p�P�@k%��8�@xT3}�=@�G6�QK@� {%�z�@�]K��K[@�����&t@�RP�D�@�R() @��c����@��0bU�I@��t��	�@��,�o�;@��Cn�`W@�.H|v@�����@�si�A�@Õ�����@��� �@@�F����@��4�G�T@͍�}.r!@�5$���@Ѷ�A�V@�L"�k@�����@ְbG���@���/\@�`�YL��@�U#*�@�\h����@�;FV�@�Q¡�N�@�q�lߘ@㚰b �^@���"~w@�f��A@�L$�{ga@��\7�^@��,�A�@�K��^�S@�EIZ�/@�!"Ԭ�@Ճ@������@�Qg�@�@�֏��@�� �ʗ�@��v��W@���[�ܟ@�p�f��@�Rc��E	@�9>�	�\@�%?��@�vN5Z0@���ԓ@���⿡@�	�Eb�d@�'��@����YK@�,l��y        ?�Q�W7�7?�:��"�?�ak�mO@ KQ���\@��M/P2@B�m�L�@ ���;@%��@wM@,��k�@2R%H��@6�8=�m@;�sfL��@@�=l��2@C��L8)�@F��a��@J8Ҫ�]e@M�gh��@Q$�M;[@S*��R�&@Uw��k�@W��K�r�@Z��D�K>@]?b�U(�@`v���@a�Q�bο@c.x���c@d�)��u@f��)8G�@hm/%�@jU���@lQ�0(q@nc�x��@pEu��@qceT��`@r��*@s�^��(5@u �&<{@vK�H���@w�<��I�@y�$k�|@zmi;�}@{�.�A@}c��f�@~��f@�A��{a`@�1u��@��=�!4o@��戔z[@��Ch)@�|�VX�@�c2��1@�N05��@�=t�d@�1S�m�@�)�|@�&U��{@�'_�`��@�,�îyp@�6q�b�@�D���j@�W�hK@�7A�"@���p��        ?��z5���?ŷ��'t	?�6v~��?���AA�+@��� �@:9��c@!)���V@*V�5� @3?�[P@; /c(@Bjޠ%fa@Hg�C~�@O��A�2@T��!@Yz~R�@^���7�@b��>)�@fl�i�΁@j��"�?@oD��1b@r5�!#��@u
'�K@x ���%{@{zew��|@�Ӱcg@�~%�&�S@�� k��z@��F��:�@�'N�0�@��f�!��@�K�T�Ej@�
`�|�P@��'��^@�
C<L�@���˭�5@�S��hş@�Ka��r@��א��@���]��@��i�@�ӈ%��@����f��@�RG2�@�6>L�(�@�c
�͝"@��}%e@�ّ����@�#?��F@�vz��0�@��2�{�@�9V����@������@�!��M*�@�Q�Qj_R@�_���@��}=�.@���,3@��5��@�Z�K}��@�6�ޱ�o@����@���̚�Z@���x�J�        ?��a훫V?Ŋ|�I[?�A����2?���Ø�@�]��j@�Q���@��Tk �@'5��I�r@0��@7�0x�tv@@�[�n�@E(aNd�@KRܣ5/@QJI�m��@U~�� �f@ZM4�7�@_��P"��@b��@#8�@fF��Pj@i� �q�j@n	�wy��@q8�Z cs@s�b�H~@v*�Ļ��@x�E�9�@{ڏGHSF@~����Q'@�(�o9�@���:�ӊ@�ͮm���@��@� +@��:�@��2Ɯ@�g  �@��㘫�@�1�x@��(�1�@��9���K@�]w���@��2��@�rA9j��@�?�Y�@��F��VU@���LL�@�[�ǏW@��
z�@���Y,@���F�@���>�i@���.�5�@���Æ�@��h.��@�#Rt�L@�W�A�nQ@���\^)@�ؖ<�]@�%n�\J@�z{l2%K@�׽��v@�������@�Ux��,I@�r���@�όp��        @�Wǖ�@Ifb�|0�@c�ۜϑ�@t�Ҙ.�@�X���|@��Ҷ��)@��O���R@��xG��}@�@�c �@�$�u�J�@����@�^x���.@��F;XA@�eE���s@�a  6�@�W�Xvѻ@¨=(�@�#��l�@��lr
@ʜ��'��@͛�z�9�@�dG,��@��V��@��X>�+�@ղ���H�@ק#M�l@ٳ�VRy@��`a�}b@��t�9@�7�C��Y@�p��O�@�畹!�@�
c��s�@�k~�N�@��g��o@�WA�ܪ�@��$,��@�{�D��@�"��4@���{�@�L��i� @�4�?ܜt@�#�����@��ꏁ/@��h6@�~����@����@�*+����@�=N��w@�VNe�S�@�u/|@j�@����%�:@�ēc�[@���b1�@�+.���A 3�w:+A �7=�Aw�v���A疼�RA���)��Ar~%�>A �O�"A����        ?���~?��&z2l?�`�	z��?�=�c�*?�8����@]��{H�@�~\�f@4�d�ϒ@� ���)@!�D��i�@&~�@*�<�:@0O����@3Y��@69����@9���;z@=n���H@@�U��$@B�,�J@E/�����@G�<v��@J=�~�^@L��cK�@O�.8�@Q~-T��@S�X���@T�L�Tx�@V�]�t��@XqL|��@Zb@��ĥ@\hg�:��@^��XS"�@`Z��+@a~71J�J@b��<0~B@c��0�@e,|���f@f}�$�_@g�:�H��@iB�ݡ�O@j��G|g@l7O���@m�'-G�@o[Gg�R@p����@qW�@�Z@r6;7DX5@s�5P;.@t6lr%�@t��`;�@u��bɮ�@v�ƷTk�@w��q��{@x�Jw��0@zȱ�$�@{h�g�@|7%�r~p@}X�D�<@~����@�ޖ�[�@�qrFr4+@�u��߂@��s�SW�        ?�n�A�~"?�]��9?�"��*j?�=��,?��A��[n@Yg(uE�@J��+@���I�@!��%8�:@)�W�m�@1e���@7t�:�X�@>�P�Iu@C�Iޱ��@I<���@Ou��"�@ST4T��@WsU_<��@\ �%t�@`�󻀇0@c�����[@f��}�9@j�
q@>@n���̈́@quVE�@s�\?�{@vp��R1�@y@ ��w4@|H�s��T@��Zy�@��$:�
@�e�W1u@�ex<�yK@�����_�@����ih@�0�D���@��-�V/�@��^�`@��ἐ�@���X�3s@�/�KZ@��"s�^�@��:�xF @�Z�#ֲ@�<%�@�3�D�@�WvW@�/�<�2�@�J��@�p\2Z�F@��Ѣ�k�@��C�,@�"?� �'@�sO�^�#@��TJ(�@�6W�L�@��d�Z�W@�%���?@����o�@���vg| @�p���4@�E#�OV�@��2&�=        ?�3�,�S?�A��8�?ɳVz?��m�A�?��J�?��ϸv�@	�ڹC2@u)\�9�@�����@&G���3X@/Y���I@5�g��7@;�u�A�@A��$@F��4���@L9m�GM@QI���@T�1%U^@X��0�1
@]z�����@a?8�C�@d@6�@g	�X�@jVG�';-@m��=(!@p�q���@s H�;�0@uA��'f�@w���K(g@zB`��d@}#m@@�'��@��rAp�N@�,�?�@��}��D@���,�@�����6@����t�@��z7�@���"�@���b�5@��1�N��@�[��s@�ma)�h�@��e��
@�0� K�@��� �s@�(�y\��@��(.PZ<@�W f��]@��m4�@�^,�G@�A���a@�,W���@��.��@�ez�e�@��q�]@�W�ҫ@�)�_�7�@�>���@�YI���@�{R�zi�@�� S��        ?�Ø�3�-@+#���@EX�{y�x@W ~mM}@dr��٘|@p'�<�t@w&Oڊ;@���Eg�@��).�)�@�q��P#i@�k�E��?@��9���
@��;Á�@�O��_�s@��C���O@�����<@��0���@��\����@��ט�@��=C�L@���4��@��;nhf�@��F�W�@��h��H@��o?qM@�f�ۛ�@����再@��q�t��@�#� �v�@Ò���M�@�A��Jt@Ɵ�0��@�?ƶ�i@���Cc�)@˯��m�@́q���@�d�Q��@@Ь�ؠ�@ѰOn@Ҽ�Z��@��T�6��@��բ;;@�6U6]�@�J�'d@؅��2�@���VUv@�*0 M�@�o���t@��oBao�@�<½+@�X��-V@��THi�@�� xc �@⦶HZU@�uNR��@�H�b��R@�!d�?0�@���eIG�@���3�@��SYR@��W���@�^4�q@Ꙅ�f�        ?��b��?.?�K�
�H?�/�CD��?����|��@��0���@)�8R�@����,@"�$]Ծ@(رY��@/�,Bs:@3���#/@7ڒ�w@<���B�@@�`NVIt@C��r�x@F�
�9$=@IרvD�m@MK�N7'@P|u���@Rp�m��@T�����@V������@X���RLQ@[e�E@]�IP�m@`I�:g@a�r����@c���@d��@f.XS�{9@g̼v0
�@iy�^�X�@k5��4��@m T���@n�ގ@��@pa4@$�@q]Kd�@r`f�u�@sk\T���@t}����@u��\���@v������@w⢥s��@yW:8~@zK��G�@{��.^ȡ@|�Q��mO@~"�r�`B@y��<�@�l 틯�@�7<� @��Xx&�@���j��@�O7��>6@��|{-@�ײ�2�#@���8O�@�o�Fݿ@�A�ɗ��@�n���@��-˺þ@���X1��@��<�l�/        ?�8��l�g?�|�H?��L���?�T�0��@
�W���@Y����@!k��X]@)ǆ6}I @2Ua�ON�@9B�8~�;@@�I�bn@F9Q ;G^@L��]��@R
Q��Q@Vm��p��@[~�t,�@`����>@c��X"�@g�y;�W�@k��HQ�L@p �lH��@r�=sS�@ujN��t�@xsZ����@{��w�'q@_,�qc@��Q;7�@�������@�	%`���@�|$(O@��_b�V@���ؤɑ@�s��h�@�
���@�������@��N���@�hd<�@�f��c[p@��d1:~h@����	5@������@�;K��D@��0G��@�����_@�9d=��@�����@�-��^s@@���I3m@�_�!`��@�c�9E/@���a�@�P���yR@�A_`f@�:D1��@�;�1Y�5@�E}����@�X
h�>@�s]&3@����1B@��ϑǇ@��-�~�@�:��h,@����%�A        ?�V��{!?�؉����?���~>k@�N��zl@t2\1u�@#|ފ���@-ر�}@5�Ttʈ�@=�n'x)	@D��*d@J@v��"@P�v����@U���@Z=�ml�@_��@c��K@f�����[@j�$X�l@o`�7�@r5���@t�că��@xp��D�@{Y��>@~��#~�@�o6�@��88Z�@��5aU@�?�^�@��aX�n>@���l��@�K���h@��{���@��.8���@�J��ZE@�%m{��v@�"L�׷@�%�Rb�v@�L��M�@���-^�@�������@�-����@�t����@����Uض@�-OA��@����p�p@��Ԑ�@����k?�@�D��t�\@���k6j�@����}4@���TT�@��e|�@���Ѿ9@���6w+@��$��^�@���&�z@�����Id@��Ո�L�@��Q2�@��{r�@�^��@�Dw�Y�@�|� !|�        @��$KX@J��9YK@dڝ&d�5@v�V��H@���Jq�@���&�*@��J�� @�X�!\��@���h�ӥ@�:�PW�@�IK�k�@��~���@��#��,@� EjJ2@�T�FF_@��d���@Œ~�Y�@�}r��f@˛��5�2@������@�:U��L@�7;��x@�ևyno@�$\<. �@�R��4�r@ۜ�Le�@�P�=Gw@�A�(���@�z���@��]�e@@�X�"9:b@��<�xx%@�Zvټ��@��^��Ai@�|Nbi@�K�̄��@�2���@����e��@������	@��vs�7@����R
@��"š�O@��_���y@��'7e3@�+ɐ��@�Ta��@��~3�x@���y`�@����"`�@�F��(L@����h��@��'�(A �׮�[gA][���Aܧ�uA�[wA��GU�kAWOƲw�A����A�6���[A�����[A����AiS�\�*        ?���]o;z?��iۮ�?�e�]�yu?����#�@j�G��@.F_ٛ@7�*@!��E���@'*ھ�@-P$}�@2�'�4�@5��:Ǜ@:&]<�@>�-w���@A��UҮ�@Dw�zXhZ@GU�z.*@Jf�wL#D@M��v�q@P�	<x��@Re�$D3@TT���!@V[���3�@X|��
�@Z�NB��@]M�sZ1@_|�̭�@a�,;�@bV'�@c�T� �6@e$z� �@f��+X@h+�_�	@i�&e�@ko˫�*�@m)LI<@n����"@pfXK�N�@q[Z/�@rXx:���@s]��8$�@tk)�{0�@u��<�T@v��Ld��@wŢg2OI@x��I��@z-�U�-@{n�yE�@|�+��b�@~��h5u@hJ�ל�@�gQr�m*@�^V�#�@��`�Ey�@��k%�@�e�n�7a@�1��.O@�!1�3@�٥(o��@��lcJ7�@����s\@�}�jwc@�h�Ȉ9        ?�<�����?ʖ�%��?�i�Yj�R?������t@�]c� 5@����I�@#E!�]�@,mA$��|@4�{E��@;W�}U��@BWK7��@Gv����@M�d���)@R�+|��A@V� ���R@[��Bގm@`���S�@c��V�Ll@f��,��@j����Q@n�/i9@q��WlUW@t<�T0l4@v���F��@y�c�.��@})GL@X,@�R���@�3;j
Cx@�7���N�@�b#��
�@���u��V@�+����4@�ͭ`y_@�M6��j@��S{��`@�\1�b�a@�]{Z��@��t�E-Y@��޵��@���p��@���&��A@��ȯ��b@��1�q��@���󸬔@��%#2@�:�p[Q�@��-g&�{@�����@�o�m�]6@��Go�"W@���I��@�*�g�0@��D!N@�Om9��)@�8#L=��@�(��?��@�!�c�@�!`�&z�@�)}O&��@�9j�)��@�Q!�AN�@�p��u�@���        ?��S�c�?Ҿ�?�y�)�@ x�e ��@�����@����u<@#ðvÞW@-s��@4�־-�/@<F��f@B�＜E@H���{��@O���@T-PA Zd@Y#�'m��@^疈�]@b���!�@f���/~@jЯq�ź@o���|�@rxp�͖�@ul�-�i%@x���@|>�J�`l@�*sXp0@�-��ȴ�@�v���S@���:�w�@���3s��@�i��@�q��$ǁ@�U�Ml@���@�ݼ ��@��<
��@�Ϛ��=@��*˸�_@�.9��`@����V�@���ώJ�@�F����@��]��.@���m�W@�v>=>7@���+l~K@��tNU��@�).��vR@���E%i@��G��8�@�0�{�;6@���܅I@�:��Z@��jX�@��;ō&@�"��f@�62��!�@�R+3d�@�vXV�@���t�S@�գ,cߪ@�s���@�UN�X9@��8��        @�ř�@I��S���@c�o���@uL�e��@���4q9�@�
xm�U@��ႠA�@�+��@�LK�	��@��]t�@�Rh$Z	:@��O_�I@�?��3��@���p�[@�or��E�@�s3�J�@��2�>�G@�,�"��@Ɲv�m4@�4�ԥ<@����\=�@���l-�%@����GP@ҌV��I@�:�� �@�����Ҭ@�ՠ���@��QL�t@��!��L@��H9N�#@�-k�@�%O�!�@�Q�>	A@�j3��v@�̫���4@��S�N�@�v����@���A���@�P�Jtcc@��q�X�,@�\9��D@��{h��@�L���/�@�%��g�d@��H�_@��� U:�@��`뤸j@�ʝ�� �@�Ġ%�v @��}/"�%@��Jmc�t@��!��@���/��@�Z�<�@�3F��,�@�^֤�3�@���x�~�@��0´�;A �C8
�A+���
�AԌ��nA�)So9�A1�V��        ?��ϾF�?ʼ'�J�?�`Ji$�?��@T$�y@)�����@�΂?�@��N`�@�&�a�@#�Z��@(�8�|@.��e,�@2�8e�-�@6�Rtk�@:�a(��@?_�����@B,��V�b@D߾����@Gʌ��o�@J�]��+3@NP^���J@P���P�@R�k�5w{@T��V��X@W)2���@Y|W�5f/@[��?F�@^��ʦ`@`����;w@b�7h0�@c��?���@e!�Wԭ@f�n�k�@hz��c�@jA�JIm`@lyN���@n N��0@pv	�A�@q
g"�0o@rR�T�@s5#┙�@tW�c��\@u�9j�ߝ@v�~z�Q�@w��b'0O@y:Σ+�t@z� �"�Y@{�MB(]�@}C��.�S@~�ZPM��@�7���@�ό����@���.�j�@�ZV����@�&�nGu�@���h�e@��l�6�@����w!@��
�D�F@�k.��;@�S�CC-@�A˹�N�@�4��ͳ@�,�%��
        ?���%��?���>��r?��i�6;�?�Ja̛�?��;xع�@p(�;��@��C&*@��2�b@ �/�7`@'�d�DR@0m�G�|@6��@<�j7MZ�@B��1�7@Gd�.~2@M��+�@Q�f#�]�@U�^� @Y�LJ��@^��b�f@b��%)@e\C���@hc7%4�@l�I�B@pNt�Oy@r.� �a@t�-�~d@w>��Qz@y��/�8!@|�<��[@��so��@��|J"�@�t��w�[@�^Vֻ�f@�e�9b<1@������@��F���K@�4o��)@�\A�ǯ@��t��@� Ew��@��G��@��%�'@��F��=@�A�C|�G@���BD@����ׂ�@��O�-�@�A%�%�@�>�0��@�E0���"@�TNg6�A@�l0�ďb@��ݤO��@��Z<��@��E#�@�#�׏4�@�gڀؠ�@���e��g@�
��tW`@�i3>�k@���w��Y@����K��        ?�z��P��?�Tz�T�e?�j��At?�V���V@ ���J
2@;�{��|@�I��]a@"z����@+s�Lu�@3���dJe@;`���@B��0ȕ@H�oM�@Oӷ����@TD�Ǹ�=@Ygf���@_aERF�@c �8@g	즕n�@kr�f+�@p/אYq�@r����S�@u얭�@y6�I��y@|���Kb4@�V��/�@�n��k;k@����`�@���g`@��!�1�2@�mN] @�Z_�r�6@�:��Z˹@�߸�Bh�@�����@�q��8�@�_�Ah�Q@�f\F��@��b��\b@���4}dQ@��e��k�@��z�~�@��I%@�L H�?@����H�@��M!tX@���^�	@��+��@�����@�(K��6�@��^ ��@�@���h�@� �9?�@� ��;a@��"��:@��~��}@���x@���x�3�@�ঢ়��"@�믤�@����y@�&z��@�1���ă        @3�A]��@;M�`-m�@T�g��.�@e���<�@s�7�iq@}wO�mz�@�ŝL�@��1�W�@��|y�@�y4{�@��>����@��`��"A@��y�g�<@���v^'7@�}�ȓ{�@�e�w)�@���qu�@�5�$�n�@��V�^��@��n1��k@��l�ձ@��=�RN|@�6� ���@������@����
�@��VvN��@�o�>��@�K�O�@Ξ9FM�1@І��-@�ʁlb�`@�k$�>@�{���G�@��Wpn�@�c��:��@��Kg�/�@ڂn�/@�&*�>WF@��hƈ�@ߖ	0�b|@���"�@�zb��@␒����@�-AH>@�Nދ�@��`W@�7�L!@��A��@�̐�<T@���@����k�@�D{T�^Q@�z�
@�BD�@���i�@�& 3�@�J���@����c\�@�I�o�U@�Ymy�V@@�A"��@����=�%@��]��?I        ?�~z~�?�p�Km?�E5C��?�~�S�?����X@�����@�$l@�@����4@��s�z9@"5�y2��@&��ɱE)@+�މ-��@0���>��@3��śm@6�d��&�@:��� �K@>|z�J@AU�./�@C����@E��� �@Humӡ�~@Kݬ�%�@M눴�o^@Po��kQ�@Q��e�ȉ@S��"7��@URAG�@WN�9\�@X��`,�z@Z뇺VI8@\� /	��@_j��B�@`�]�h�@a�m��f=@b�Ե��'@d(�㟝@ejl��U@f����@h�� @imE?�0$@j�҂� �@lL|��g@m�H/m	�@oT=8��@ps����@qBs.���@rmo'i�@r��"N@s�{���x@t�£Ec�@u���)�o@v�5�m�@w�}U���@x|�_��@y}F7���@z�Ⱦ�iq@{���@|�:a@}����@~נ�5P@�"�9>�@��6�7� @�)���'        ?��d�x�?�x�����?��#k%�?��4L�?� .��Wx@��y��@�
E�@�3�,��@$rD�k�@-����@4�}+�'@:�{��b@A�t���3@F�xͿ�@L���\U6@Q޼:��@U�%����@Z��x�:K@_���	��@b�gIԌ@f8$��@i���6�@m�`�6�6@q6X���@s�CЎa�@vJGO��@y&��2�@|<LȌi8@����:@��l�]T�@�s�?9z�@�z�$yWm@����>��@��k���@�^�xH�'@��}����@��V|��g@�H�PK@��e[I8�@�h�f���@��/�@�ޤ �@���N=$@��>�P|X@�����@�k���@���!�@��:�./@��t�zsq@�$����	@�q�Y��@���a`�~@�0���@��	�28�@�"Pu���@�������@�G�&LS�@�w.��5@�Q$���@�1�ɓ��@���{�@�3�d��@���+,T        ?�F�#�Y?�zdBe�F?�0K�@V�?�I�	6�@��/{3@�>+��@C��-�@&�9�f�&@0!]3z@5�(�}rC@=
���@Bߙ��@G���)@M�]쉈n@Rkp�$�&@VV���D@Z�Iľ�@_��*^�'@b�&8l�:@e��E�X@@h�QL��&@lrFM��"@p)T2�YG@r@��O��@t�ꡪ7]@v��G�(]@y����W@|A/���@0�O���@�'��D��@��BY@���IH��@�i��5��@�^,�u@�l��7&K@���,�9�@��j+Y�@�����7@��'�{br@�+���3@��>��@��Z��V@�na[�{@���k�bd@����>@�9�	��@��D�œ@��Xd�@��9��]{@��}����@��le'�P@���+<�@���
P�@�ԥ~�@���a�q<@��!�@�5#�\�@�d6E\@��H0o@���A[`�@���~d�@�eB��l@�[i�}�+        @�w���@;Jm���@U�Qt7�@f����@t�x�A@n��~�@���cf�X@�
�d��@�X��e!@�։��@���D �@�g"Cב�@�#&�(&�@�1��G��@��oO��@� O�)�
@���Xz�@�D/"��@�����@���]�RV@�Cq@�@���#�e@�Z�<t�@�c7��(@��b{�%@���@��� ���@���}��@��o�|y@Ц�I8@��'F
�@���s���@�2ꯐ�@�s���3�@ֿV���0@���~ω@�s�# �~@��h�d�Q@�OL%Ba@��US�@�S��
�@�r�67L�@�@�L:�@�T��"@��/��R@��v���w@�3�	��@�pe���@�2�Ŝ�@�{D}oV@�u[�E�@�t�v�O�@�y���B3@넄ي��@�ϒc�d@���?�r)@��Dq��1@��o�n|�@�� ��̚@�^��T@�q�<��@�RW�ջ�@����@        ?��oϕ?+?�;���{?�d<w�B?���?���p�A@T�M��@�ﾾ?�@?$1��@�o���@$q�=Q��@)��G�@/+-t��p@2��:-��@64�`3��@:���b@>$�7?��@AO%�y�m@C���o�@FL.yL��@I)��X�@K��dn��@Om4K��@Q.�����@R��4�
�@T��>ݐ6@V���n�N@X��`F @Z�O#�@\�y�9��@_"<j@`��"! �@a�Zn<@c5����@d����
,@eڬ[�G�@g>!1I�@h����|@j&�ye��@k����y@m;�鷳]@n�`�ŀ�@p?RGOB@qc7F��@q���:�@r����yY@sȎ0�@t�d}n�@u����q@v��=V@w�޻��@x���G�@y��oX@z�AIe�@|
e�Y�@}0t���@~]��g@�
u0T�@�g %B�@��:�p@���`ԛ@�X�`|I@����,r@��v���        ?��Hl?�zl�J?ϡ�2�,�?�5���)0?�#�3Pf(@�̉�@�S�@י@�[�>�$@$%	�-c@-c���u@@4�2W̻@<_),E�@B�`��@H��61U@O��W�q@S�r�@X��_N�@^5�d�K�@b>����@e�F�:#@iȳ��"@n9{�xz�@q����Tk@tE�+�@w:aEf�@zq��<�O@}���U"@�ד ���@�ۯ"���@��s���@�O�Q�3@����p�@�V�D�o@���n��@��R&p1�@�|�3e�n@��u�44@��!���@�|e'�m0@�N��,@�5�[�{�@�1��K@�Bgoz��@��_-�A
@��a�Z�@��Uv.��@�/Nڃ��@�n_7پ�@���\��@���W4�@�n�e��?@�ڌp�)�@�Q�D��@��_��@�b]�h @�}�H��)@�P`7
�o@�(�g��@���nR�@���ZO@��0��+�@�ò+���@��
�Z$P        ?��ĜU�?�_���~0?��Q��?�Q��K@ �,/�@�J�J@,��.�@ ���@(#���@0�]A�w�@7d^F�@>���/�@D`�:�*@I�7UXp\@P,nE�d@T��χ�@X�t%{|@]�e��m@a�L*�@e.��LU@h��y@l��t�@p��a@s=e����@u�&��@x�kJ�Y�@|�Ư��@s�`yB�@��B�q{,@��SӃ�@��H���@��Fh�@�@���@�@��<>��@�$�Y1@��'��/>@�K�F�~@��hv���@�J|&])@��+y��@��qЁ[;@�=J��<-@����u)@�״�ţ�@��T�f@��P��'�@��W��;@��I'�m|@��/�Qg@��!]@�2\G�@�\%Ex]@��fX<�r@���T��]@��*�� @�V�9�d@��2��WN@�/�PiK@�5a��@�� �П�@�����#�@�f\����@�*&����        @,4��?�@68�G��~@QZnx�G�@b�ޝWch@p`P {�@y���"~*@�Z�1�v@��[��}@�`k|�]@���|��@��R�Kd-@�`�Q��g@��5܎�>@�%v(ZT @��˖O�3@�ʨ�z�@�2PY�)@�Q�K�m:@���D�э@�X���@�B
��@��*\@���oGr@�Sͤ/@��h�=�@ň¼)w@�[�è@�@��cP@�7�(!!�@�BNf�c@�_iɖ�|@�Ǡ$݇@���ǭ�_@�ݫG7�@�Hb}�c�@Ն���3:@�Α��G�@� -�>�@�{?Ur��@�ߒ]QV�@�M^g$@�î�$@�C��	�H@�f�*��@�0��0�@����?�@���U)@��oA�?@��1�)�@�q�b�:�@�[�"
q�@�KM��|@�?��W}�@�:V�Ż@�:5L��U@�?�Ȁ��@�J��B@�[w,�$�@�r;[M��@�,��BW@�YCqv�/@��@�QG�@�&\         ?��9��?����=b]?澬R�?���K��0@�C��ns@
��1@���s@q>��%�@$����@*&�Jn�@04蜲�2@3�ֻ�@7��G�T�@;þiOn@@-�����@B����Pu@EY6����@H:i�.�@KO>lI:�@N�|���@QW��@R��#_�@T���8�@V�B��@Y�R"�@[[��甁@]�J{�#[@`��$8@am�_�h@b��{f�@d6���;@e�W���@g:sn��@h���j*}@jz��Wd_@l1ȁ�"�@m�s��l9@o�� �o@pڤ����@q�����@r�h�6*�@s�'�N��@t�@nG�Q@v�uA��@w:�q��@xh.PM��@y�(��J�@zܰ���@|#˷�^@}s~�iev@~��HZ�@�TU�@������@�����"@�Ar;�@�d�W{@���޺�@���Ϻ�7@�_Nj(@�1D��$@�a+��@�᝷QO @���8_E�        ?�z�^��a?т�\��)?�#Ċ��J?���!KG@S��L�u@D:x�1�@"�B:v�@+ً��@2�#\�m�@9�>���@@��I
��@Eڑ]���@K��Ͼ�@QOs�Nu�@UP����@Y룍��t@_+��d:�@b�J�Uv@e�Kci�@i�XxS>�@m��c��@qf��o�@s�<d�U}@vD��[`@y1c��@|Z�z��@ά�)@����P�@��9T���@��!���@��O���@�]��曷@��l�e7~@��IF�/a@�/�8���@�����"@�>X�x@��|�9P�@��6;N��@�q�~���@�Yv���@�W�z��@�mK��@��Q5l1@��z�·x@���)�&@�X��_�g@���bVT�@��ٵ],@�S�����@��0��<�@�;]vz�@����@�Wso]�@����+. @�����a5@��4�S�J@��O ���@��A�Z��@�v-���@�oڍ٢�@�p���'-@�xA)+Q�        ?���P� u?�L�%�:?���$?��Ln|w�@s&�r�@��p��@ճ��d�@(F؇Q��@1�Y�B��@8�]V@@��� �S@F�3�o,@MY|�
7@R��By�@Wxg?y/�@\��N��@a��.�:�@e=�I�Q�@iF�ci@mǶ�J@qb��˽�@t!����@w$O��Wx@zk�N���@}����7�@����T9�@��#V{�+@�5l=\@���Yl�@� �mYI@���k�}@��&��H@�_v��G@��$h�P@�����@�v�KxP!@�W��tK�@�PW��6@�`�!
y#@��s��|�@�e)�[@��ĿpY%@�ʓ����@��%PB@�`頟9!@���5��U@�(}��!k@�����-�@�!�w�6@������Y@�N6ذ��@���U� @��B#�@��G���K@��*��@���s�D�@���'є6@��Rz��@����΅�@���U���@��ƥ��@��a�8be@���@5�        @�\��@CHB�@\�@���Y@n;nE��{@zqJ�&Ҍ@���J4&�@��1S
�@�W���@��/U��"@��D��@�(��G�>@����G_�@���aݯ@�O�S���@�k�as��@�ϛ�quB@�}Q��*@�;w(�c@�_4tb�@Ī�7��v@�� �S@ɼ�bo@̄��6n�@�xܞ�U@�K�s�m�@��K
��@ԭ�����@ր���J@�jje�wM@�kX�PuZ@܃~_���@޳>�z�@�}'f?�@���T1@���H+@�0�y�@�E���@��h�s�@�T���@@��R�yeU@�X���X@�d�@�6�@� �y�_�@���s�a�@���q�@����H�@�øi��@���J�@������@�µ��@��A���@��*����@��f�,�@��U�@�@�2U�(@�l�@�wY@���N��@�����O�A ��S�`�A,�D�NiAѴ	̓�Ay�'t        ?�}V���?Õc�sj?ܲsf�)�?��򜞟?�QY�@S?�͏:@^�L9�@#X�,`@�`]��@! G�c�@%?����\@*
�ìZ�@/fG9Wu\@2�����@5�3�˖@9����6�@=kl�r6@@���;W@C.��C�@E�K�z�@H%ﺻ��@J��Ω�@M����B�@P�o���@R-�o�Z@S��q��@U���_4@W�jR��@Y������@[�墡D�@^43R�U@`8��^�@an�03�q@b� #�E@c����U@eWE�
�@f��%@�@h-��m�w@i��W�$0@k3�d�h@l��/��@ng�Q���@p	�t=}�@p��8�@qǍG.�L@r�����@s�L/���@t�=�`�@u��d�9N@v���ǁ�@w��H�s@x��y��Q@y�?0'@z����@{���Nb@}#t|.C�@~Q�UE @�w \�d@�`uT�h;@� �[E�@�������@�IlM�'�@�����        ?�)�
h?�@Q��i!?�I��W,@ �.U>S@l'��0@�<	k�@%-�:�_@/��
��P@6��Y��G@@����@E����X@M��Ӎ@R�4k���@X!�Н@^;���P�@b�݃%��@f��E��0@k;o�@�~@p+C� @s�՝hD@v#���Q@y�Q1�n@}UZ�]@��#���x@����|@�M2���j@�ݡ���3@����ck�@����t~�@�X��
i�@�����K@���p���@��e�4�@���$��K@�Ïh��@��[A%�@�N���g@�`�z�}Z@����@���6@�h�
I��@�࿣Vgq@�h�ў�p@� �;�-@����_��@�b���k�@�,A���@�1��@���3��@��'���@��L��"@�
1�kI�@� �O�c@�?S�~@�e����@�����@��qTL��@�
P]��@�Q5q��@��##�S@��#0��@�+!&# @��Ȟ���        ?�<S��?�r?5�
?�s$��t?�6��y@�?��1+h�@ �;P�@w�D�!�@p1-+p�@%�#�[�c@01��@6�����@?2*Q�n�@D��IFJ@K 
a@Q>yݚ��@U�/��v@Z�B�ń@`'&�m�@c`{�`�@f��X� J@k o��s@op�y;�@r(#B�w@t�-��@w�.ا޷@z�&$Čy@~M)�І@��c>& �@������@���꜏@�`7����@�͎�!�@�b���:�@�!��$Al@���a�@�������@�.#"f��@�����a@��U?�@��C7���@������@@������@��w�o_@�ȿW��@�3)l�@�mL`�@��Ə��@�!B*�@�h J@������@�SWU)�@�ݩ@I�	@�v2D؅�@� zY�I@�iM[Lk{@�K`�D��@�4�^6#@�%�F�$�@���(�@��ٖ'@�%I��q@�4*���A@�J�hEs�        @m�[v�@9�����@R���-�@c|�+O�@p�z�l0�@zn�$�>@�*q�=�@�j�}G�@����Kb=@������v@�w�d�+@���ζ @�V�1�.�@���ѿ�@�.���ߏ@��c��@�h�}Ī�@�g�>Tr�@��=Vn�@���A@v@�ᄰ�c@@��?0+�@������^@� N��)@�j,��X�@�كd�Z�@�hsw |@Ћ���@@���Y!qk@�jB���@��A`��}@ֈA�S@�.�{'��@����Qv�@۪m#��@�}�&Q�@�`Aj�ap@�t4O<@��B��@�,�W@�j�O@�φ%�(&@��}/��@�R�L�@�5��Z@�d��[�@�/����@�ؒ�٤�@�ì�(;@�g��gZ:@�-��!?@������A@�7��0�I@�����@�5a��E@�We���@�tH4��@��S}7�@���]+T@�TI�!��@�H�<��@����Hǡ@��$T"��        ?��S�0?�亴h??��!rc?�w����?��&���8@R���@^�}7�@hor�,�@�C�[�@@ ��"�F�@$�ɡ�{@)�L�Z�@.��'x7@2Y�at}@5���d5N@9#�&�Ot@<�d�m�@@�: �i7@B֌��@EA�2ix�@G�^�W�<@J��R#@M��^�"�@PYڛ�@Rr%�-�@S����v�@U���2�@W��9@Y��a�s@[��\�k@]�2V�=@`$Y��@a[+)�p}@b���K��@c�I���@eM&�?p@f���+w�@h1��N@i�"M�C.@kNV̂�@l�n�p�8@n�C[0R@p0P՗Oo@q,��*�@r�Y	Ź@r�� >�@s�zc*D�@t���Ɏ~@u���)�@w��@x�6���@y5�
��@zX�6M$@{�bT��@|��$��@}���h@'_.M�(@�6�*�@���8 @��M;�4@�5j�ώ_@��q�1Q^@��o��p        ?�u���?�E��$\?Ѭ=�`�?��I��?���DT@S�( �x@֕�r�@9�y��@#xe�W�1@+����g�@3<v�@9�ި��@A�T���@E�)���@K������@Q7���[@U�3pG�@Y�����@^�}�Z@b&�WtF@eREA��@h��ʇ{@l� ,B�5@p~<�Z��@r�x��@u[dVc@x���d�@{�K]_�@~>qCD�@�Ӎ{|f@��X �W�@��N<�@��OX;�@�ЃxgX>@�=`B�@������@���ԁB@�b���r@���eN\Y@�C�Du�@��>���@�i����@�Y��@�ֳ����@��F�m@��Q��N@�A���@�Fc���@�T��\9 @�l��T	@���..y�@���]�,�@���<�@�0��M��@�z�:X+@��@�x7�@�.0�@�����b@���d.@�E;b�{@�
�ԟ�@��<���@������H        ?�t���?��f�4��?�p���	?�S��RY�?��Z�[�@�2��]d@�O���@#<����@%��'*VR@.�򵜬@5n���hj@<یo6F]@B��eǚ�@HkIASb?@N�t>_pR@S3A@Mu@W�5���@\�a��:i@a���mF@d=br��@g�5�9@k��L�H@p:e/~u@r`�6`�@t���U�E@w�^a=#@z�բԵ�@~Y澮@���Q��@��(���@��;�`�@����2td@��7*�D@�p�Q�p@����J� @�PG��V@��2,v�@�0���5�@���Ӱ%�@�\B
�@�cW14@�֏��c@��#�mE:@��t "�>@����D�8@��?3
[@��dRB�O@�xKu��@�J��7�@��ꇰ4F@�ȅ79*�@��:� �@�t�D�>@��5���@�N��tJ@�̸��l@�WB���@�v���t@�H)Q��@�� �D@���`��@���я�E@��w葂-        @�%=��@/D�ma�@Id��E}�@\c2o��T@i�'?�П@t�j�Z�@~A���~@���T�7�@�ӂ >�@��x���@�h���b@�����{�@��Fc�v@��ܨ	�\@�G`���@��W��@�<����v@��H���@�C��Y�@��hІ�e@���फ%@��o/D�6@���4�Ā@�s�ӎ��@�-`!}�@�����@��/g.o@������@������@�Ӷ�@�Q����S@������@�g�(�@�I��gd�@Ԗp����@��bMD��@�T�q�{J@��T6?�S@�Dð`ɐ@�� x��@�hhwkYy@�܈�X-@�`B�Ynv@�@9ʫ@�&���$9@�;p���@�a�w��@�`�<t@@�I}Ճ@�,�Od@��W�o@�5&�C�@�S\���@�x�;~�
@쥄��2I@�ٔl���@�	��"�@�+��m:�@��5����@�zD��Lj@�':abJ�@��,��b�@�.�>sC        ?��x�q��?�+!�Tp?�Lɱ8!I?�ؒ
��?���L��H@֯���@lbf��@�̚��@�'�`�@�u��F�@#�Y�F��@(7����|@-ZYA��@16�O���@4!6�!]�@7J��@:��,Uy�@>_S��2@A%� y�@C=S�J@@Evn�J�@G��[�W�@JP�b�@L�)��2�@O��	Z�@QS����@Rܼû(@Tx�� 06@V'��-`�@W�+`��@Y��(?@[�
��@]�h���@_�L�K&A@`b��@b�0^��@c6:����@di���!�@e����Gw@f����hv@hD�À�@i�U�JS�@k�))Y�@l������@n�QU��@o���2�@p��΀]@qb�D*@r9UlpZ�@sƩzɚ@s�^O�@t��T�@u��2�n@v�7r! @w�9���@x�%���@y�S7��@zα}}@{�Y[3�@|�cmN��@~���	@?�Ѥ�@�6Ir�ߢ        ?paB��A?���Y�?ë*R�S4?ڮ�
w��?�9_P@B?�����@]�=k��@�ׄ��@d�B�a�@&O���:@/��z��&@5�
�%p@<�p�o�@B������@G�����e@M��̒�@Ra{�1�_@VZ �(��@Z�dh��@_������@b���T@e��Ħ�@in�ĈZ@mA��Ր@p�arH��@r�z֬	�@uw�����@x"�V�@{�ەb@~<��/;@�����]V@�q�@&��@�O�V�*@�J#���@�a�)~@��q��CC@���:�@�\��T�F@���aȊ@�M���j�@����}dh@�+�&C0@����ط�@�Eؕm�@��q^��[@���=�Q�@�bA|?,@�5�˗�@��^�AZ@�����Fe@��l_�۽@��N�`�@���)J t@��9c�_@���Ā@�FU	@�?X��z@�|H�X�@��6g�l�@�=�.�U@�iw�]�@����a��@���kț�        ?�h:�]��?�Ғ�Q�?ֶ�ƭ�?�`�F�?��_�N�@�"�\{�@��$"�@�+�=6�@&��`84�@0+1?@6���z@={Ƒ���@C@{Ј#@H�^���@N�J8T%�@S,�����@WecO^��@\/&}#x@`���u>E@cƗb��@g۹
��@j��C>�@n��{;�@q}�����@s�W��D@vL�����@x��(�@{��ş��@~�ª��&@���
�z@���5��|@�p����x@�L��,�@�?�KW�@�JL��@�l�l2�@��x_���@�}b�nhG@���bAJo@��{�u�X@�Fm�!e@���n��@����@��7 ��@�D�rQ@��{+�'@�G��a[@�����W�@�^�x�y�@�Gs]Xա@�8*Ne�@�0�d��@�1M�)v@�9�_M"@�Jk����@�c���@�����	�@���`c�J@��Гav@�cs�;@�X�XH$*@��.�Si�@����
        @ (��
�'@.�/"�/�@I'6�Z�@[��^��@h��q�H@s���}.@|�c�o9�@��6,7ϟ@�ѥ�/�@�{7N��@��޻;�@�ۤ
 �@���㝷=@�����я@����c�@��0XN�@�D�U9T@��J�Z@�fΛ�/l@�t��@�����2@��� @�K��o�@��+FD5@�k��q@�7�kA�@�N<%t@��D�\�@ŊZ�4Q�@�&	��KK@�фemr�@ʌ��HQ@�X�2�{@�4�T�!�@�a
��5@��ke��@�����@�#�� �M@�:`KV�@�Y[{1J@��!�:f@׮&�(�w@��_	 ��@�"@ ~��@�g�?��U@ܴ�9du@��s�@�d��x��@�c��:*@���0E�@��g0�]X@⍥֓e�@�M�����@�A��U@���Fˡ+@�,��o�@�s�dF�M@�F�R�9@�;�
�q@���X�|@��(L\Υ@꼷h\�@�T:;|�        ?��G�R>?ԋ��Ÿ�?��b+�?���ݬ@
�.�-O@�V�	/�@�# �@$)X�_>@*q#�L��@0ӝ�E�
@4�ׇ���@9{=�Z�@>��,r�@BOj x6@EO&��@Hk��y��@K��hRC�@Oڨ��#�@Q��<��=@T4���8@V��Չ@Y�����@[�6Ņ@^�=���@`�{ �^�@bR� �@c��Ʒ�F@e�w�W�@g����@il���s�@ki����@m|�T��&@o��FC@p�/��@r�\�vq@sS�h�#�@t�Ճ�yE@u�c�r@w=0O�Z�@x��U��:@z��{�@{�1G�U@}����@~��b�l2@�+�G?l�@���*`@�����G@��v��r@��w�_�G@�� ��b/@�� 
��Q@����A�@��0Vt\@������@��c���@���1��@����!@�ӓ6�E@�D�@��@�u>9��@�U�  ��@��g�w1@���m��        ?�a��6*�?�}�-2�B?չ����?�ߓf��?��.K)��@
���F^{@���R��@!�$�ug�@*��Ԭ}�@3e#iga@:���K @B@b��$�@H���95@O��?�@S�T�R9@X�τ
@^.���W@bP�;�@e�x�>�=@j�䅱�@n��fZR@q�ڬ�@tŀ���N@w�P� �@{ZXԕ%@M��Y@��I��@�֟��82@�@<渐�@��=Y]�@��ǎ�&r@���@��@��:��S@��*�z�g@��M�\W�@���KuS@��̹yl@��s�m�@�.c�r@��˖��@�'%����@��J�Dc@� �mS�@������@�$Ӛ��f@��r~غ@����Ч@�ox>-�@�[P��2�@�-�>
_@�8K|��8@�M(�_]r@�ly�,�-@��Ny�A�@�ʶ���g@�	�ڂb@�S����d@��!��@�V.ҹ�@�qy(?��@��t���@�fHn���@�xz�BJ�        ?�Ge���?�C��
�?�3��K�@�7@_��@\��y�@#}����@.&jf�\�@6��Z�@?"F+\�@E=��:�@L>��|�@R]�ק��@Wp��	��@]l�2�(@b3 ��r�@f8��^��@j�ð���@p�tt��@r�WHl�@v8Ԓ̝�@y����F�@}�c�_�^@�%?�q��@��[�>�D@�0��u�@�
��3��@� B[��@�q��Z@��p���@�g���@�n��iɫ@���4ߝ @���դ��@�J���@����)4�@��H�I@�.)h�@��:o�p@�8����@��vz��@��9Cf��@�W�l�N�@�3�b���@�$A��v@��� 
@�!�_�@�9��N7@�[5�*��@��/m�^@���u�@��i]@�QB�B�~@���-$�1@��ֆQ<@��Xj,�@��-�7@����'�@���m�d�@�[GH4b�@�0�3�J�@��n@��أ4�@��ȷ�$�        @����W@GZ�آ�Z@aʟw���@r�D�8��@���X�a@�I�<�@��K��@��`17@�X��@�ϛGӡ�@�7�6��1@����i@���h�@��*��N)@��jy��@�B\DP��@»"F[@�h��[�@�Mn��@�j�Ra@��]�(��@�(��4�:@����s�@��Yg�@�;vh��@ق�zz�@��E���+@�t�{��@��9���@���(�>@�tw��E@� ^Ĉ�@����@�O�gdR�@���	@��F0�)@��+� a)@��~	�z�@��9�@��y��<@� !��^@�FҔ��P@�w�Һd@��N<�n�@��Nc�yg@�I�"rN�@��7d�Y�@�>"
��@�|C��@������{A ?!O��A��>6A�#m�2A���[X�A�/�1[Aa��d^�AFB��8A0�s�A>����A���a6A	�F8 A
SSÝ�AI�h�        ?��`u�� ?�W|$�ʔ?�搉z?�Ǥ��@߷�LQm@ٙ'�V�@+i��ћ@/�Ä�@#�N(��@)���@/	f���;@2��`�@6���3�I@:��y��@>����X�@A�ѣ���@DWJ���B@G
΅@I�cי��@L�0��@P7�+c�@Qɯ0� @S����e@Ur/��M@Wh�/@Yt�ϺX@[��KqA�@]��2�$�@`-��$:@aH_���@b����&@c��>ߎ�@e0�:�by@f���B�@h�U��@i���د@k�K��@l�Jh@nO�3<b�@p �	�e@p�S��R�@q�u7�J�@r�;��U@s����@t�����@u�5I�%�@v�eܞ�e@w�8i���@xʳ�H�e@y��Z��@{�St��@|0ckEUb@}_��w�@~����l_@�mb��@��� E�@�/��yi@���B��k@���5[@�1� ���@��D޸Z@��B��@�P��}��        ?�QV ���?�mʸ�K`?�:	p� �?�8���?�veZ��?@���b��@?�N���@ZT�T��@$	+[��@+h��Jt�@2A7�W�=@7��Q�ƶ@>d�)i#@C�����@G� ��:]@L����`@Q{lt�5@T����Ն@X��,+�`@]���b@`�Z��@c�����h@ff�a�!@i�7����@l�4�W�@pT�M�7@rTW�y2�@tz����(@vȷ���>@y?��3�T@{��ׅX�@~�">��@�ы) P�@�cJIS�@��O�t@��";�T�@������@���i.�@��5�v@��6ia��@��`[���@�"��DD@�X@p)�@���B)@��ିP�@�I�(�@��w��J@�,䇇8P@�����]/@�F}\{��@��Ց��	@�������@��L��@���Ҡ�@�|Յ�V@�o��DW
@�jXi�z@�l9W�[A@�uK�^��@����h�1@��&b�O@�� .U�}@��-6p_�        ?���n��?�g���O`?�=�B�?�* G�O@Ab���S@̂��@��*��@"d��8��@*r<h�ӧ@2d�D���@8�A���@@o�-<�@ECӻ�A�@K<��@P�J��su@T�e���@Y?��p��@^S��L�@b�da#@e7��"PG@h�z��@l�p�e�-@p{�����@rӢ�Hj�@u`x!��@x"���@{�k��@~RW�G��@��e�y�X@��t$�C8@��S��_@��
��$�@� ����@�]FK}�k@���(�@�Bs��@��2���
@�"#ټ��@��bn��[@�SyFQ��@��$:@��M���@��s���@���V$��@����� @��j���@�$�F�@�L#6��@���赦@��4@@�"G	m�J@��v���@��Ħ�O@�mN-?�^@��/�v@���^٥@�+�td�@����ؕ@��s��o�@�����rJ@��1��@��kV��:@����I�E        @p��w�@@�l�Q@YzU��@j���4�Y@wy���t�@�#")��y@���_<X@��β%^@���g�(�@��lӮ*�@��Qɼ�G@�����@��k FI
@�Fa�܋@�q��j��@�x�'O@����j�@�̓\�>�@���sf�@�&W�7y�@�����@���]��X@Źm�ħ�@��Qy���@�骆N�8@�&�߿�e@�|��t�@�vJ:#�5@Ѻ��L1�@������@�k����f@���x�:�@�Q�nx�
@��5�w @�ns�O��@���{l=@���na��@߂8�ଷ@����@�� �*@����M@�t�C[@��Pn�@啜nR��@�T����@��1���@���(��	@��5���@�4<@��@�hy^�Ng@����	�"@��m��@��N���@�J�2�@�h�H�6@�}J��@��1�4�@�z�BX��@�1�a��2@��W,]�t@���'�@�grw��v@�)���f        ?��u�XX�?��^�?�H&��R�?��[\[?���68�@�~��)@sKC@���ł@����@#>|M�~@(�� !G@-��b9A@1�\֚��@5?�;�K�@9��fi!@=$<�^��@@�ǣ��&@CDy��T6@E�\���@H�L��@K��$���@O�-�+@QK�[��@S*h�U�;@U'�p@3@WC�n�1@Y�2`fcQ@[��F�@^ZPkw��@`|���I@a��ˎ�@cN���P@d�ō7{@ffNS�_@h��,89@iķ��n�@k�����@mk�2�9=@oZ��R�V@p�,Ű�@q�����@r̹� ��@s��3���@uU�ο@vF Fk�@w�e}U!�@x�6�?�@z���`�@{z�߰چ@|��-���@~U�p�u@ӷ�y3�@��H��@@�x5�q$@�G�� �@�����@��K�,��@�׏/$G\@������@��:�c�@����f!@����@��2%��        ?u�R�ܒ�?����?ǂM��z?ޯeR9�?�E�UA�?�SI�@	����@�����@0�t�@&�&��@/�H@���@5�L����@<|����@Br�ȅ�9@Gop���S@MD/�ӹg@R ���@Uت�~K�@Z2�f5a�@_�	7s@bAa@eC˘;@h�_>7rv@l,-#�FQ@pv����@r,�]R�6@twu�/I@v��2/�@y�Q�=�@|f��ƃh@j�Z)ʃ@�PE���@��s�.�@��U�i@��e�P@��(��S�@��u�B�@���mB�@�z���{,@���z�@�E�+�*4@��
�@�N�ڱW@����i@�bC1-@����L�@�\�6l�.@������@��3�2�@�e z4Y@�]��2 @�_�����@�jcΧ;�@�~#?�X�@��
����@��7���@����ɤP@�)�f��@�l�~9��@��'�"(@��E@��@�p�^�@�ڤ��H�        ?����9�?�dxt��=?�r��,S?�*pv��?�A����@
��ONpZ@<���Q�@�a&���@'��?�.@0fA�q@5���z@=3o�c��@C�b�@HX�S-�$@N��
U@R�vX��@W=u~�@\�B�i@`�Sc�{@c��?�@gC��&�@k
��X��@o1�d��@q�g�v�@tW���@w��J@y쪼��S@}�R�@�3J�-��@��e��@��p�r@��5��"�@�#O�}Y@�r�I.T'@����/�@�{b��u�@�H���@����U@�a��ή@����xJ�@�RR�ߔ@��%7�@��0ߎ3@�ϥ����@��n��GT@�qj;�<@���éf@�����?@��;�Zz@����@�K+K�Q�@���PzYg@��.bE��@�W1`�)@���PHuY@�D�BjѲ@����
�@�0�H�W�@� ���ZE@�֋��@��])��@���R\@�{��Q��        @�M��*@4�I`'Z�@P�g��A=@b&Zۿ��@p3��'�@yos�'�@�Z�`�wG@�8��_y@�X�L��Y@���O��S@���j�	�@�,�FϾ@���B1�U@���㧻@�����#@�t5e]�G@�ڞ��r�@�$� g�@����d5�@�:���E@�
b��@�	|��1@����YRd@�Mb�K�@�V��@�����@���a#��@��i���@�D8/�;�@Γ?���@�Py�wS@��{��@�e:��@�xE�q�V@��P���G@�i����;@���i��@ڙWh���@�H�4j��@���Q�@���ˌ�w@�ܳ��N�@��iW�`@�֗��
�@��Q�"�7@��U%^@����@�1(�o�@�]u�uz~@钇r^F�@��m��@�3H��@�f��1�@Y�o@��F���@�� >��G@�LV��@�?K��1@�F{*^�@��T�)�@��nPy	�@�m;Ƣ@�Ev���        ?�Td���?�D��;�i?�a(\mY�?�JDiUS@	���(@���q��@`��N�@#*4���p@(懩\��@/fL��c�@3UZ�i�@7Z$����@;�~t
k�@@E��EM�@Bێt�h@E�|�ql�@H�_k_�;@K�K�:��@Oo�Z@QT���h�@S3��E�@U,��@W>��?�@Yi���@[���a@^�w��%@`D�)5y�@a��(O}@b����m@dIm��[�@e����t@g6�pH{w@h��.̅@jU���t@k��!D�@m����Q�@o_�4��M@p��S3R@qz�?�o@rh����~@s[�z���@tT�����@uR���q�@vV�h��@w^�g"7�@xmG�jc@y�:�x[9@z��9bsi@{�Loe�@|ߖ�.`@~
��קu@;�U�l@�9����@��+Cmϧ@�y� ��@�sn���@��,o��@�p�_���@�%��*�@�Δ'�@����V@�8I"���@����8L        ?�M|>��?�{fjdu?�Ҡ�?�yۢ�2?��z �@�P�@���9;@�m�/�O@&�v��'�@0l����@6�2�|"@>� )y�@D2 ��Hh@J;��y@Pu�G[C@T|U|O�&@Y ~#f�@^k�<��]@b3�V��q@e���%�@iGcY=f�@mdS9�@p��v�X@si�	��1@v�p	�@@x����@|:}�@i
R�r@�|_u��n@�bl$�Ȳ@�gx�?�@��]CP@���H��m@�9 �Ek�@�³��8@���#���@� '7I��@����!@�(m���@������@�|��T<@�D|3k@� �1�o@���}�@�
q"^�@�l^�Y@�/7���@�R��;@��(_δ�@���l��>@��1���@�P�@k�{@��hlmК@����B�@���DAtb@�*$���@������A@��m+��@�xޗɥL@�VK�6�@�:ʥ��@�&n�,S@�H`��        ?���Bp5�?ұ/<6�S?��nw�^�?�)bc@
��v7�@��:j�@ 7;W�5k@'!� G�@/�%��	@5=�)��@;�[/'w�@A��hi�@FI�a�@K���4�@P��MD�@Tc���@X^)7T��@\�9mx��@`�ۢ:�I@c�ST�:@f�V�ZH�@j�n�@m�~ꅍ�@p�@�t-p@r��zY�@uNÏ���@w�����@zo ����@}B����6@�"'���@��Z�3�@�j��P�@�3W;���@�����=@��_a@�$� ��.@�T5کV�@��h�x9@�ۇ$s@�B䐾PM@������@���#⺼@�\��}s�@��"�M��@�e-Me��@�`{Ŀ@��%z�@�k�2u��@���`#5@� T�0@�� �c@��	�G@�Ԉ��@�.�z���@�OE���S@�z]��'	@�� ��C�@��eg�1"@�;�|�F�@��E1�"K@��"�GZ�@�a�$�.�@�mF�
 �        @ �'�f�@I:�/�H�@bd�� M@s0F�\!@�G�o<��@��T�]�@���u�W)@���N�eB@��t'��@�&s���@�uY�bd@�3���@��1P;�@�~��W�@���B�@�å#�t@�:g�e�^@�t���5�@�h}��V@�x�kY�@ƥ*��O@���@�U-v��@��+���@�=6�M�4@ќ�!�Tk@�
� ���@ԇ���Zt@�2��p�@׭x�.e�@�Vz�)`}@�<�x�%@�Ե��h�@ީ����@�F��P@�?0i��,@�>�r>�@�D��_� @�Q�[�@�c�����@�|EI�!@��W�;�@�ya�@��2�D=V@� ���@�N��=�@��l��@��7w��@�
̈�E@�l3��@�]y��@�
�\�'@�5��ڊ@�t���@�-�I�g�@���I�A�@���8��@�p���/@�9�a�Ӄ@�P�&�@�ּN`�@����$��@��
�9�        ?��V绫?�nT�G�?�V;�ZG@I�@��@0�x��'@q�#��J@$���y@,@ey>�E@2S�P���@71���E@<eu���@A#9釐�@D\��FQ@G��-� @K�D�?��@O��:�D@R�u l@Tf�w�@V�-��@Yz#��z�@\:s�@_)�M�@aW�I��@b���5Q8@dR�5<�@f�(�
�@g��r@i�Qҵq@k�Cm���@m��]�d�@o�<��@qr~*�p@r$����@sQ��
k@t��_9j�@u��֙�@w3�3_�@xt��;}@yٟ���@{I��ߠ�@|Ž�-�@~Mj4%c@��t�@��f �@��U��p�@�r\�C�@�T��??�@�<׻�@�+q�� @� l �C@��;�:p@��� px@�&;�?@�5�ꤐ@�I��A�@�d��j�"@����5�@���˘V�@�׋o���@��LW� @��'�/�@��(��@�[�����        ?�`K* "Z?����R�?���� ?��c��@8��O�@��_ܧ@$�u��@/�ri�@7@���M@@hzTzl@Ff		<@M�ln��0@S=٧�@Xe	Kk�b@^^��@b�i��p�@fzq�O;a@j�	 Z@o�_o�'�@r��d�@u���@x������@|U��	�@�#	�Lq@�7x>� �@�~a�4�@���ө@���KD0u@�c���)�@�c4��Z�@�IUؙ�@��df�`@��$�3��@���,)�@���yzJ-@��4.�h.@����3�@�11�5��@��<��t@����,�@�]�B���@���Z���@�'��l~@��v��>@�)�_z@��1���/@�`_p')�@�LwW�@�ʟ��g,@���)�L@������@���H�@��;ɚ?�@��*f��	@���)9�@��io{��@���7�^�@��Z]$�@���	t�@����wH-@����3@�@��'�F@�r�]PH        ?�5G��+?ֶv<q��?�@|-"@�e���@Q�|���@ KDn`7�@)�,���@2�S�k@;Kz��a@B�8�pj@IQK��@Pj�9Ъ@U8c�k@Z��'��@`oM�e�0@d����@h'�	�w�@l�����@p�ff���@s��dj��@v˾����@z#|�
��@}��  @����ķ�@����.��@�2M�	�@����I� @�14��B7@��bC�2@���Z��@�}�7��Z@�$p�A;@��2�0�@���t5�@��}�k��@��� Ě@��Ⳮ��@�/_����@��{)5�{@���@�U<xE�@��MCp��@�sD��@�����D9@� W'

@��p��0W@�b%�7O�@��u�(U@��61
�@��5�`@������@��X�9�@��zqn��@��?skZ�@��(l�@�uQ��@�'�����@�P{���@�������@���@��,�{,�@�;�=ޡ@��+��        @,�i&��W@WW����C@q'�2EM�@����`%�@��^<�S@����Y��@�������@�@IZzW@�d���@�)X(��@��}h�@�O,b'�&@� � �{�@���~d�g@�R򄅁�@�L�5-wN@�|�|��@��jw7@м�ϥC@ң.�l'�@ԣ���l�@ֽ�H�M@��L1G@�?���@ݦ!�~�@�r�ǒ/@�`�$V�@�e���Q@�#i�K�@�4d��@�*��9.@诹|WG�@�QKF��@�E�y��@��N��@�և��Y@�zRc-�@�E��E�@�]}�p�@��qC-@�ϥ4��^@���ӸL@�ƛ��@�7uM�5�@�j��tҕ@��N��2@��6uf>(@�6����@��>�ib@��?�2�A �?G[Y�A^�i[��A<Z�?A�97�{�A�{̠]�Af�{`Z�A3�{�AE�*�@A����A��'y�fA�9o3�0A	n��#VA
R�5�l;        ?��� �$?��G!(�N?�4tQ��?�sJ&�])@ �5!R#�@
Yŝ�}A@H�mJE�@��g!D@!�&չ�@&�!ٿ�@,bl���@1h=IRZ@4����}@8�U��@=W��"�@A��S�w@C��dv��@Fz�B:wy@I�����@L�о�UR@P"~g%�@Q�/f�:w@S����=@V�4^m�@X@�*]@Z��ޅ�@\���ڸ@_��h5t�@a���@b�x�RD6@c�2��2 @e}C3!~�@g��>�@h��Kd�C@jt;��Ɨ@l>LT�y @n�L��@pN��9�@q^1�IC@r
)��K@sDd���@t3 t�g@uT��KcB@v~���@w�!���A@x�<X{�@z3^�!,@{��+N��@|�핓�@~9H��Φ@�����j@��P9զ�@�G�%��[@�	�q���@����)Y�@��۾�0@�jn�`��@�>�>ZL@��ur�@��+c�v�@��;(��@��2�C6S@��$w0�        ?���W�?�X̱��?��t��$?�-ݸc@A9�4�@l���u�@!]�/���@*p��ռ@3*XZ�@:�|��=@B')�&7@G��J@N^	P�9E@S`k���@W��t���@\��1�@aW���x@d�.���@hX��� @lt��|�@p�"���@s y��=<@u��O�@x�L�+��@{��f�Y#@~�$@@���[���@��xi�@��4
x�@�6M�J@��ʉ�@�]�Y/+�@�^���@���+
�
@�-�� �@��#э5�@��)�-�@�}�'bT1@�t	ĳ@�� e�@��}Ш(`@�y�r��@��d����@��.T�1@�6G�K�@��k��.m@���	a��@�x�X�m@���@���A��@�K�ח��@�	���@�k츂�~@�\4W�l�@�U��\S�@�X:�/N@�dY@ �q@�z� �@���Y.��@��4�}�@��Ը�{�@�4�����@�|�lwޏ        ?�`���?����@��?��$:t!�?���\j?�+|B@�_FaP@�	��Z�@�.�Y@'r�%�9a@0�����@6�H'g{r@>L����F@C��Ԇx�@Id�I�@OZ�7/r�@SK�FB��@Wk g�@\��3@`�Ty�F�@c��,��@f��q ��@j4��&��@n��|�@qH�8H�@sK6+���@u�~��@x@��P�@z�S���s@}�\��M@��� [�@�(u����@��P��E@��ѥ� @���e��@��D�=N�@��]<(T@�.]���@�G�
PR�@���M�c�@��2ج��@�0(��5�@���+�T�@�2��@��|}6�_@�3���&�@��*H�
@��R��^@�S�����@��{�_��@���8b��@�}%��&�@�}^�5@��u�
�(@��4�&@��Xo@���>3d(@���{A�@@�F5�y�@�L%џ�=@��~��@��T�ۜh@����@�3DO�T�        @	L~R8~m@7c�0�@S>o~�,@e�B�x�@r�?��1@}�눰�@��%�V��@�	���y@��q�0P@�k.[�@���3sp@�pRÙ@�g����z@��ɧ�h7@�L\����@��=O�@��^?
��@��m�O��@�ݙ�W�@���p�8@������@é��7�@��b��1@��AU�@�Mƛ �U@��
�\�U@�S��J�#@�����@�l˻/,@��h�S'@�sO�R�>@���>?�@��Vp�@ڂ�=CR@�V.J�L@�<�Ȧ�@�<��V@�!f���?@�0�Ơ�@�J@�jQ@�l�%KZ@嘤���@��Et)��@�w���x@�V=��2�@ꨛ�e�?@����1@�j69���@��t����@�)"h��@��K �@�/�[$@�zҟ��@�J;A�@�u�ڦn@���*B8@�ա�qH�@������@�����@��p�u�@��&�C�g@�y(��O�@�v��U        ?�q<��p?Ϲ�"�?�:�?��BH��@���mZ@��L�@X�.k@"�^M���@(^�[���@/�;�l3@3U%8�J�@7���#�@<av��H�@@�*�	4@C�}�(�J@F���P>�@Jgg{* 
@N#���a@QZ/��x@S4��$>@Ux?U�E�@W�9?D�"@Z_�� �@]�"��@_�՗�H�@aQ��f��@bϷ��%	@d\ٚb@e�B{�/@g�hX��	@iQ��0�@k�i@lޕ�iS�@n��;J4�@pM5%��@qD�g�ٵ@rAo����@sC�����@tKb𓦄@uX����@vk'�We�@w�nV�(@x�r��1c@y�I���@z��m
h6@|���E�@}T�E��@~���΋@�K�=ZC@���j\�
@�3�b�?@�ݡh!�@���.n�@�;`�M�@��4�)��@��}qq�
@�aW?��x@��ԟ�@�����@��	8�L�@�q�$.�A@�?4i�@�a�)��        ?��	�Ifj?�C9���O?�7V�*@
꨻R�@�F�@#U�4��@,�4^�n@4��-E@<3m� y@B�Ǜƕ�@Hj��.��@O0�Pr?u@S�r.ͭ@XR�V���@]�i�\�@b
���\�@e�E�Ұ(@i�<=�2 @n.g@�f}@q�1&k̏@t`q$/�@wl�'q'@z�W55�S@~c���@�)YCB�d@�I�;@����Hsp@��9y�Q@��L�n�@�l2��	�@�1���-@�Ā���@�o5��2#@�2u9�@����@�*^.�@��{�m @�A�pj#@���0�F�@���i��@�5�|��$@��J@jJl@��MB��
@�M0l��@��&0�
?@�R_���@��3p��@��[�l�@�N!|�c@�ӕ�
@���(�@��WV��/@��g�m�(@�ﷹ(� @��H���@�$�$1@�1#!0 @�Wd�#�@���Y�	@��T�*H}@���1@�AL��f�@���E�M        ?������?ե�y5�?����@�.O��@\&�uS@�{e��@%�~e3��@0|\aO@6m�n�@>u�9�7�@D-����@J/�}�l�@P��,��l@T�D��@Y�Kva�@_����(�@c�}m@U@f��Oצ@j�>�Y�t@o��ŋ��@r[�g��@u0���C@xOU05@{�!�E�@uX*,�@��U  @����j�L@�U���w@��`��K+@���~��r@��'��@��-���2@�{-"ئ@�9X��3@��r@ @��8YH�@���I@�"��j~x@�Zzj��*@�U���"@���>*��@��HYo!�@��p@B�@�u�j���@�ݷ2%Z�@�R}���(@��0���%@�b�w�@����:@��]�%@�/d�Q(�@���y,&@���w0��@��Dd�&(@���gǄY@���$u�j@��6����@��2$�F@���̨M@�)H���@�N��!��@�{���!~@���k��        @`�Ft�@K�)���@f.2�}8@x�Q9m�@�*��]�@�r��_�@��V("@��FTo@��gʪ�@��'"�ڿ@�r���@��Ҁ,s'@��ӌ�a�@�L>�#r�@��2v�-@�#T��@��<��@��0��Ƨ@�@�}��@Ϲ�Yo�@Ѵ4��أ@ӥ��f��@կ��^�x@�ҙp���@���7�&@�]_�h�@��F�W�@�9$c��@��l�I�-@�:t�:�@䔙�AyG@��ǰ�}@�`�ݦu:@��"��@�GwZ�A�@��eW�@�D�W"��@��P��@�+iLnYv@���Ŝ��@�]��6@����U�@�_xH�S0@�4��#֕@�GK��;@��
E�@����7�@��}5��@��"d�l�@������@�ueɯ�@�k�(;8@�e:8�{@�d	���@�g�]�z@�p��b|�A ?O��A ��0��AUo�ؾA�vT�Av��v?Ah�*OzA��t�9        ?��în?���rg��?Ї�;�N�?�h|h�?�Ao���?���T�t�@�h�ǡ@
6h�[x@f|R�ь@^�p��@
�hZ�@!8'�lh�@$�Q��N@(��U�`o@-���@0��x�T@3�QR#b@6]9��E�@9g�'��@<�U[X*�@@��܅@A�s�$@C�mS�{ @F��y�@H\1@�7@J���!��@MHvB��@O��:-�@Q`Re=e�@R�ذ���@Tc�؊�@U��v(j�@W��V�)@Yk�z��\@[<j��jr@]�6��@_i�d��@`���_9@a�f���%@b��*^�@c�MM�{v@d���3�(@f����@gX�О�r@h��^vZ@i�Ś@k9��i 4@l��F[��@m��hҝ�@ok����@prCS]@q2�/��@q�Zz��@@r©OT�@s��|Q|@te��ġ1@u>�n��*@v;ˡy�@v��{���@w�����@x�MgP�l@y�Qh�b�@z����{)        ?t�آC�-?��um�KG?����%?��"я?�u��G?�W��3�@]���5�@��ښ�@����/X@%�q�ˡd@.��`)�,@4Ֆk�N@;����@B}��@GC�\{�@MDx�L�@R��˳o@V{��t�@Z�q����@_����Pj@b�6U�4�@f���6@i�C����@m�i�f��@q��a�@sxHK�@v��+w�@x�cF�>�@|�T�L@Y��~�-@�vS�T�e@�`��C
@�m���@����V�@����h;@�e���@���J�@���^\�@�U΢y��@���w���@�wfH��c@�%-�,f@��>�љ@���N��@����S�+@��3��^@�T�B�lI@�d����@�}���>i@������@�ˣ�;p@� L�G��@�>����@�����Y�@��d?�d@�,�u��&@��A�AZ@��W�؅�@�k�O5@�s=��}@�50����@��^I��P@�Ź�'V�        ?uVl�ʒ�?��p���4?ŝ�wY?ݹꍴ?��?6@ */@�U|@�r�@�(��Ak@"U^%��@+6�A��5@3mJ�G�@:ֶ?y��@B��ѭ@G����o@NY8�˃�@S"2�}�@W�C�<�2@]�����@a��@d�2K@h�>6��@m�0$7l@p�^��W@s��~�q@vq!9w6
@y�C��1@}��_�@�[r�E\�@�[��/f@���+��@��B�A#�@�H��,@��=��@��ދ�@����16�@�f�JQg�@�|$Q
@���;�@��0x���@����t�@����r�@����;@��\9�K@�?ݧ�Z@�?�B���@�{O4��/@��G�U�4@��b�+x@�s;��@��ٓ�pK@�RA>l
@��G1�i1@�_�ׇ�`@��1�?�p@�N���s@�%��n&@�<��,@��m>�qO@��E�}F�@���WL�@���0�xu@��p�Q�@���O��        ?�)����@"2L�]�@=4�~��2@P:i�t @]n���x�@g���)�@q\5�@x$%�!�@����@�����<�@��,�L�@��~T�@�vYc.v�@�=Ě�z@�k�M.*@�)�Ǵ@����8y�@�B ��_�@�9�w8{@�n|9�B@����.�@�L����V@�J�k��c@�l��9k�@��T����@�"��0�Q@���Ok@�z|[�\@�2#�O�@¼u�1�D@�\˹b�@�
��;@��2rO�@ɺO�5H�@ˮ+b���@Ͷ��|��@��5Sz�{@�/�s~@�$p��@�Pꠎq�@ԇ�|	�6@��Q���i@�xhk�,@�i�:@��꥙��@�3��ݡ@ܧ$'t*@�%#Ǿ��@߬��L*@��&�d�@�l�%�z�@�? �
�,@�l� @��є�M@�ӧ����@幍���@�BĔ��@瓵�w�@���N*�@�SQvi@�}#l���@�}��mê@삛wL��        ?�#-��*�?���A�v?�i6��˫?��I��ܨ?�IcRZ�?����I�x@��(8C@����B@-F��%@�Y�5&@���T�@`�Tz�h@"��,��`@&Y�RI@*1Nh�@.d{�k@1{$O}B�@3��v!�3@6�"Ď�J@9A��ţ@<����z@?�m3�2[@A����x�@C��2��@E�4#.��@G����E�@I�]�apL@L;G���@N����x,@P� ɵ'@R��>�f@S~�ר8O@U:m��@V�M����@XH��O@Z,�&</@[�"��p�@]ǀdf��@_Ǡ!��@`����c&@b+�";F@c&��$�h@dS��ӫ@e������@f�����@h#5!�W,@i�ם��@j�	Xo�@lb¯�@m��4^@ow��@p��qTfs@q`Q�pvp@r<�n��@s��Fǔ@t	�_ev�@t��w+�u@u�YjAY+@v����@w��[�+@yhR�@z��l@{1�I��        ?s�� �?��.,\?�64� �?��@AKu?�9hqMM�?��k~|��@g�1�@�n�J@�	M0b @"��"��@*�\�\s�@2N���kK@8nAM� @?��� �@Dc�r�%�@I�ł��@O�G{��@Sf���o0@Wk�|��@[�<
u�@`�x�b*@ca���L-@f�-x�&@i��]2@m�҆@p�n��"K@s5�Db�t@u��#���@x>�K� @{@jy�/@~�ְٰ@���ِ�\@�S����W@�#?�l�W@���R�a@���hpN@�;�C��]@�;��,@��	���9@����\.@�H2�GA@�a���@��c�!@�S�I�g@�嫤p>�@������R@�<�\��v@��>	�@��xh~J�@�`C�bT@�]�b@�b�S�e�@�qCk��@���p=OQ@��-�%S@�ҥxo�U@�+�\@�@�z|�W@�����"�@��pC8Q@�*�!�1�@���0VR�@���6�        ?n�EH�Uv?��L���{?����Dg?��0)A?�����w?��nQH�@bL���v@���u�@-��h~�@!��� `@(O�c��L@0���Hs@6r�уF�@=je���>@B�\�`@G�Sw��@M�p!Fl}@R,��Ҳ�@V�0�Ca@Z_%)��@_Ga_�@ba�����@en/�K�@h��n�C@l~�)QP�@pE�vK@rx�!j@t�R'x?�@wq&Л}�@z9	ŹZ@}5��,�@�4X0��@����Ё�@��`�QҒ@���a�a�@��VI�d�@��kG�<�@�7�/�k'@���|�>Y@���l&@���_��@�_�Wyrv@��p��,G@�k^KGb�@��hA-W@��O
v�@���T�@�dXj�q�@�S�v�F,@�����r@��{&y��@���l�z�@��1$@�O�~�@�P8ÇA@��1kb�o@�����@�3�WQ��@����4��@�|�Y�@�zJ��5@����@��r���        ?�官�E@ Dc*��@9� ��T@K���[8@X��g�F/@c��Y}�s@lOQ߽1@sbD6�@yzѤ���@�=��@�5B��4@���7�@���g̽_@���Q|�@��e�o@���/�p@��nrb�@�!ٯ)�@��t���@�&]D��@��J�I��@�5D�bs@��`=�@��͑ �P@����@��w�``z@�z�� (@�Wj_%ɺ@�N+�~�o@�_���@��]��@���Q~@��$��2k@��yb:��@�.���@Ď�М�@@����闹@�B�Ppj@������@ʱ?V��@�c:J4n=@�&]8]@����+�@��y�c3�@��=�{�@��DR�@���hJ)w@�n�|c�@�0o܈Lz@�X�K��@؊K־6@��[O���@�	�JI� @�X4L\.J@ݰ,7��@����@@�>�6e;K@���r�`@�>ia�W@�}� p��@�G���:@�7y�_D@����=